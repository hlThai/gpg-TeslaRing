/*global Components: false */
/*jshint -W097 */
/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

"use strict";

var EXPORTED_SYMBOLS = ["EnigmailPrefs"];

Components.utils.import("resource://enigmail/log.jsm"); /* global EnigmailLog: false */
Components.utils.import("resource://enigmail/files.jsm"); /* global EnigmailFiles: false */

const Cc = Components.classes;
const Ci = Components.interfaces;

const ENIGMAIL_PREFS_ROOT = "extensions.enigmail.";

const p = {
  service: null,
  branch: null,
  root: null
};

function initPrefService() {
  try {
    p.service = Cc["@mozilla.org/preferences-service;1"].getService(Ci.nsIPrefService);

    p.root = p.service.getBranch(null);
    p.branch = p.service.getBranch(ENIGMAIL_PREFS_ROOT);

    if (p.branch.getCharPref("logDirectory")) {
      EnigmailLog.setLogLevel(5);
    }
  }
  catch (ex) {
    EnigmailLog.ERROR("prefs.jsm: Error in instantiating PrefService\n");
    EnigmailLog.ERROR(ex.toString());
  }
}

var EnigmailPrefs = {
  getPrefRoot: function() {
    if (!p.branch) {
      initPrefService();
    }

    return p.root;
  },

  getPrefBranch: function() {
    if (!p.branch) {
      initPrefService();
    }

    return p.branch;
  },

  getPref: function(prefName) {
    if (!p.branch) {
      initPrefService();
    }

    var prefValue = null;
    try {
      var prefType = p.branch.getPrefType(prefName);
      // Get pref value
      switch (prefType) {
        case p.branch.PREF_BOOL:
          prefValue = p.branch.getBoolPref(prefName);
          break;
        case p.branch.PREF_INT:
          prefValue = p.branch.getIntPref(prefName);
          break;
        case p.branch.PREF_STRING:
          prefValue = p.branch.getCharPref(prefName);
          break;
        default:
          prefValue = undefined;
          break;
      }
    }
    catch (ex) {
      // Failed to get pref value
      EnigmailLog.ERROR("enigmailCommon.jsm: getPref: unknown prefName:" + prefName + " \n");
    }

    return prefValue;
  },

  /**
   * Store a user preference.
   *
   * @param  String  prefName  An identifier.
   * @param  any     value     The value to be stored. Allowed types: Boolean OR Integer OR String.
   *
   * @return Boolean Was the value stored successfully?
   */
  setPref: function(prefName, value) {
    EnigmailLog.DEBUG("enigmailCommon.jsm: setPref: " + prefName + ", " + value + "\n");

    if (!p.branch) {
      initPrefService();
    }

    // Discover the type of the preference, as stored in the user preferences.
    // If the preference identifier doesn't exist yet, it returns 0. In that
    // case the type depends on the argument "value".
    var prefType;
    prefType = p.branch.getPrefType(prefName);
    if (prefType === 0) {
      switch (typeof value) {
        case "boolean":
          prefType = p.branch.PREF_BOOL;
          break;
        case "number":
          prefType = p.branch.PREF_INT;
          break;
        case "string":
          prefType = p.branch.PREF_STRING;
          break;
        default:
          prefType = 0;
          break;
      }
    }
    var retVal = false;

    // Save the preference only and if only the type is bool, int or string.
    switch (prefType) {
      case p.branch.PREF_BOOL:
        p.branch.setBoolPref(prefName, value);
        retVal = true;
        break;

      case p.branch.PREF_INT:
        p.branch.setIntPref(prefName, value);
        retVal = true;
        break;

      case p.branch.PREF_STRING:
        p.branch.setCharPref(prefName, value);
        retVal = true;
        break;

      default:
        break;
    }

    return retVal;
  },

  /**
   * Save the Mozilla preferences file (prefs.js)
   *
   * no return value
   */
  savePrefs: function() {
    EnigmailLog.DEBUG("enigmailCommon.js: savePrefs\n");
    try {
      p.service.savePrefFile(null);
    }
    catch (ex) {}
  },

  /**
   * Compiles all Enigmail preferences into an object
   */
  getAllPrefs: function() {
    EnigmailLog.DEBUG("prefs.js: getAllPrefs\n");

    var retObj = {
      value: 0
    };
    var branch = this.getPrefBranch();
    var allPrefs = branch.getChildList("", retObj);
    var prefObj = {};
    var nsIPB = Components.interfaces.nsIPrefBranch;

    for (var q in allPrefs) {
      var name = allPrefs[q];

      /*
       * agentPath is system-depend, configuredVersion build-depend and
       * advancedUser must be set in order to save the profile.
       */
      if (name == "agentPath" || name == "configuredVersion") {
        continue;
      }

      switch (branch.getPrefType(name)) {
        case nsIPB.PREF_STRING:
          prefObj[name] = branch.getCharPref(name);
          break;
        case nsIPB.PREF_INT:
          prefObj[name] = branch.getIntPref(name);
          break;
        case nsIPB.PREF_BOOL:
          prefObj[name] = branch.getBoolPref(name);
          break;
        default:
          EnigmailLog.ERROR("Pref '" + name + "' has unknown type\n");
      }
    }

    return prefObj;
  }
};
