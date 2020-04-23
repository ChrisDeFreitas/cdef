```javascript
===
Test FF extension development
===
- based on code from:  
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_second_WebExtension  
    

Issues
===
- currently working on native application solutions
- repository contains MathQuetions.exe for testing native applications.  This is an old Delphi application I created for my daughter when she was 7.  The source code is included.


Notes
===
  - background scripts cannot access page script DOM
  - page scripts cannot access background script DOM

  - messaging between background and page scripts  
  -- test: //test basic message passing
  -- src: ui.js, sidebar.js
  -- references:  
  --- browser.runtime.onMessage.addListener  
  --- browser.runtime.sendMessage  
  
  - create an object to manage the messaging  
  -- test: //test CMessageQue
  -- src: CMessageQue.js,  ui.init()

  - test: //test calling background message handler
  - src: sidebar.js, ui.js

  - test: access js modules from background script
  - src: ./background/*, lib/module.js  
  - note: modules must be compatible with browser js version
  - note: technique may work with sidebar (a page script)

  - test: //test calling native app
  - src: sidebar.js, ui.js
  - works for .exe file, but requires this registry setting:
    HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\MathQuestions
    = C:\Users\chris\Code\FF Ext\cdef\native\MathQuestions.json

Links   
===
https://medium.com/front-end-weekly/es6-modules-in-chrome-extensions-an-introduction-313b3fce955b
https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_manifests#Manifest_location

```
  