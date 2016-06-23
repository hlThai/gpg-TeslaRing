/*global Components: false */
/*jshint -W097 */
/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

"use strict";

var EXPORTED_SYMBOLS = ["EnigmailKey"];

const Cu = Components.utils;

Cu.import("resource://enigmail/log.jsm"); /*global EnigmailLog: false */
Cu.import("resource://enigmail/armor.jsm"); /*global EnigmailArmor: false */
Cu.import("resource://enigmail/locale.jsm"); /*global EnigmailLocale: false */
Cu.import("resource://enigmail/files.jsm"); /*global EnigmailFiles: false */
Cu.import("resource://enigmail/gpg.jsm"); /*global EnigmailGpg: false */
Cu.import("resource://enigmail/execution.jsm"); /*global EnigmailExecution: false */

function KeyEntry(key) {
  if (!(this instanceof KeyEntry)) {
    return new KeyEntry(key);
  }
  // same data as in packetlist but in structured form
  this.primaryKey = null;
  this.revocationSignature = null;
  this.directSignatures = null;
  this.users = null;
  this.subKeys = null;
  this.packetlist2structure(this.parsePackets(key));
  if (!this.primaryKey || !this.users) {
    throw new Error('Invalid key: need at least key and user ID packet');
  }
  return this;
}

KeyEntry.prototype = {
  parsePackets: function(key) {
    const packetHeaders = [":public key packet:",
      ":user ID packet:",
      ":public sub key packet:",
      ":secret sub key packet:",
      ":signature packet:",
      ":secret key packet:"
    ];
    var _packets = [];

    function extractPackets(line) {
      var is_packet_hr = false;
      packetHeaders.forEach(
        function(packet) {
          if (line.search(packet) > -1) {
            is_packet_hr = true;
            var obj = {
              tag: packet,
              value: ""
            };
            _packets.push(obj);
          }
        });
      if (!is_packet_hr) {
        var obj = _packets.pop();
        obj.value += line + "\n";
        _packets.push(obj);
      }
    }
    var lines = key.split("\n");
    for (var i in lines) {
      if (!lines[i].startsWith("gpg:")) extractPackets(lines[i]);
    }
    return _packets;
  },

  packetlist2structure: function(packetlist) {
    for (var i = 0; i < packetlist.length; i++) {
      var user, subKey;

      switch (packetlist[i].tag) {
        case ":secret key packet:":
          this.primaryKey = packetlist[i];
          break;
        case ":user ID packet:":
          if (!this.users) this.users = [];
          user = packetlist[i];
          this.users.push(user);
          break;
        case ":public sub key packet:":
        case ":secret sub key packet:":
          user = null;
          if (!this.subKeys) this.subKeys = [];
          subKey = packetlist[i];
          this.subKeys.push(subKey);
          break;
        case ":signature packet:":
          break;
      }
    }
  }
};

var EnigmailKey = {
  Entry: KeyEntry,

  /**
   * Format a key fingerprint
   * @fingerprint |string|  -  unformated OpenPGP fingerprint
   *
   * @return |string| - formatted string
   */
  formatFpr: function(fingerprint) {
    //EnigmailLog.DEBUG("key.jsm: EnigmailKey.formatFpr(" + fingerprint + ")\n");
    // format key fingerprint
    let r = "";
    const fpr = fingerprint.match(/(....)(....)(....)(....)(....)(....)(....)(....)(....)?(....)?/);
    if (fpr && fpr.length > 2) {
      fpr.shift();
      r = fpr.join(" ");
    }

    return r;
  },

  // Extract public key from Status Message
  extractPubkey: function(statusMsg) {
    const matchb = statusMsg.match(/(^|\n)NO_PUBKEY (\w{8})(\w{8})/);
    if (matchb && (matchb.length > 3)) {
      EnigmailLog.DEBUG("enigmailCommon.jsm:: Enigmail.extractPubkey: NO_PUBKEY 0x" + matchb[3] + "\n");
      return matchb[2] + matchb[3];
    }
    else {
      return null;
    }
  },

  /**
   * Get details (key ID, UID) of the data contained in a OpenPGP key block
   *
   * @param keyBlockStr  String: the contents of one or more public keys
   * @param errorMsgObj  Object: obj.value will contain an error message in case of failures
   *
   * @return Array of objects with the following structure:
   *          - id (key ID)
   *          - name (the UID of the key)
   *          - state (one of "old" [existing key], "new" [new key], "invalid" [key could not be imported])
   */
  getKeyListFromKeyBlock: function(keyBlockStr, errorMsgObj) {
    var ret = [];
    const beginIndexObj = {};
    const endIndexObj = {};
    const blockType = EnigmailArmor.locateArmoredBlock(keyBlockStr, 0, "", beginIndexObj, endIndexObj, {});
    if (!blockType) {
      errorMsgObj.value = EnigmailLocale.getString("noPGPblock");
      return ret;
    }

    if (blockType != "PUBLIC KEY BLOCK") {
      errorMsgObj.value = EnigmailLocale.getString("notFirstBlock");
      return ret;
    }

    const pgpBlock = keyBlockStr.substr(beginIndexObj.value,
      endIndexObj.value - beginIndexObj.value + 1);
    const tempDir = EnigmailFiles.createTempSubDir("enigmail_import");
    const tempPath = EnigmailFiles.getFilePath(tempDir);
    const args = EnigmailGpg.getStandardArgs(true).concat([
      "--import",
      "--trustdb", tempPath + "/trustdb",
      "--no-default-keyring", "--keyring", tempPath + "/keyring"
    ]);

    const exitCodeObj = {};
    const statusMsgObj = {};

    EnigmailExecution.execCmd(EnigmailGpg.agentPath, args, pgpBlock, exitCodeObj, {}, statusMsgObj, errorMsgObj);

    const statusMsg = statusMsgObj.value;

    tempDir.remove(true);

    var state = "newOrResult";
    var lines = statusMsg.split("\n");
    var idx = 0;
    var cur = {};

    while (state != "end") {
      if (idx >= lines.length) {
        errorMsgObj.value = EnigmailLocale.getString("cantImport");
        return [];
      }

      EnigmailLog.DEBUG("state: '" + state + "', line: '" + lines[idx] + "'\n");

      switch (state) {
        case "newOrResult":
          {
            const imported = lines[idx].match(/^IMPORTED (\w+) (.+)/);
            if (imported && (imported.length > 2)) {
              EnigmailLog.DEBUG("new imported: " + imported[1] + " (" + imported[2] + ")\n");
              state = "summary";
              cur.id = imported[1];
              cur.name = imported[2];
              cur.state = "new";
              idx += 1;
              break;
            }

            const import_res = lines[idx].match(/^IMPORT_RES ([0-9 ]+)/);
            if (import_res && (import_res.length > 1)) {
              EnigmailLog.DEBUG("import result: " + import_res[1] + "\n");
              state = "end";
            }
            else {
              state = "summary";
            }

            break;
          }

        case "summary":
          {
            const import_ok = lines[idx].match(/^IMPORT_OK (\d+) (\w+)/);
            if (import_ok && (import_ok.length > 2)) {
              EnigmailLog.DEBUG("import ok: " + import_ok[1] + " (" + import_ok[2] + ")\n");

              state = "newOrResult";
              cur.fingerprint = import_ok[2];

              if (cur.state === undefined) {
                cur.state = "old";
              }

              ret.push(cur);
              cur = {};
              idx += 1;
              break;
            }

            const import_err = lines[idx].match(/^IMPORT_PROBLEM (\d+) (\w+)/);
            if (import_err && (import_err.length > 2)) {
              EnigmailLog.DEBUG("import err: " + import_err[1] + " (" + import_err[2] + ")\n");
              state = "newOrResult";
              cur.fingerprint = import_err[2];

              if (cur.state === undefined) {
                cur.state = "invalid";
              }

              ret.push(cur);
              cur = {};
              idx += 1;
              break;
            }

            errorMsgObj.value = EnigmailLocale.getString("cantImport");
            return [];
          }

        default:
          {
            EnigmailLog.DEBUG("skip line '" + lines[idx] + "'\n");
            idx += 1;
            break;
          }
      }
    }
    errorMsgObj.value = "";

    return ret;
  },

  /**
   * Get details of a key block to import. Works identically as getKeyListFromKeyBlock();
   * except that the input is a file instead of a string
   *
   * @param file         nsIFile object - file to read
   * @param errorMsgObj  Object - obj.value will contain error message
   *
   * @return Array (same as for getKeyListFromKeyBlock())
   */
  getKeyListFromKeyFile: function(path, errorMsgObj) {
    var contents = EnigmailFiles.readFile(path);
    return this.getKeyListFromKeyBlock(contents, errorMsgObj);
  }

};
