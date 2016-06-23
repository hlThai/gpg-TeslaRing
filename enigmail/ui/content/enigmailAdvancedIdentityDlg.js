/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

/* global EnigInitCommon: false */
/* global ENIG_HEADERMODE_KEYID: false, ENIG_HEADERMODE_URL: false */


"use strict";

EnigInitCommon("enigmailAdvancedIdentityDlg");

var gOpenPgpUrlName;
var gOpenPgpHeaderUrl;
var gOpenPgpHeaderKeyId;
var gOpenPgpSendKeyWithMsg;

function onLoad() {
  gOpenPgpUrlName = document.getElementById("openpgpHeaderMode.url.name");
  gOpenPgpHeaderKeyId = document.getElementById("openpgpHeaderMode.keyId");
  gOpenPgpHeaderUrl = document.getElementById("openpgpHeaderMode.url");
  gOpenPgpSendKeyWithMsg = document.getElementById("openpgp.sendKeyWithMsg");

  var settings = window.arguments[0].identitySettings;
  var openPgpHeaderMode = settings.openPgpHeaderMode;
  if (openPgpHeaderMode & ENIG_HEADERMODE_KEYID)
    gOpenPgpHeaderKeyId.checked = true;

  if (openPgpHeaderMode & ENIG_HEADERMODE_URL)
    gOpenPgpHeaderUrl.checked = true;

  gOpenPgpUrlName.value = settings.openPgpUrlName;
  gOpenPgpSendKeyWithMsg.checked = settings.attachPgpKey;
  if (window.arguments[0].pgpKeyMode === 0) {
    gOpenPgpHeaderKeyId.setAttribute("disabled", "true");
    gOpenPgpSendKeyWithMsg.setAttribute("disabled", "true");
  }
  enigEnableUrlName();
}

function enigEnableUrlName() {
  if (gOpenPgpHeaderUrl.checked) {
    document.getElementById("enigmail_bcUseUrl").removeAttribute("disabled");
  }
  else {
    document.getElementById("enigmail_bcUseUrl").setAttribute("disabled", "true");
  }
}

function onAccept() {
  var openPgpHeaderMode = 0;
  if (gOpenPgpHeaderKeyId.checked)
    openPgpHeaderMode += ENIG_HEADERMODE_KEYID;

  if (gOpenPgpHeaderUrl.checked)
    openPgpHeaderMode += ENIG_HEADERMODE_URL;

  var s = window.arguments[0].identitySettings;
  s.openPgpHeaderMode = openPgpHeaderMode;
  s.openPgpUrlName = gOpenPgpUrlName.value;
  s.attachPgpKey = gOpenPgpSendKeyWithMsg.checked;
}
