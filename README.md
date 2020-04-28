Test Browser Extension Development
===
- based on code from:  
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_second_WebExtension  
    

Issues
---
- currently working on native application solutions in Windows  
- repository contains MathQuestions.exe for testing native applications.  This is an old Delphi application I created for my daughter when she was 7.  The source code is included.


Notes
---
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
  -- src: sidebar.js, ui.js  

  - test: access js modules from background script  
  -- src: ./background/*, lib/module.js  
  -- note: modules must be compatible with browser js version  
  -- note: technique may work with sidebar (a page script)  

  - test: //test calling native app  
  -- src: ./native/*, sidebar.js, ui.js  
  -- ref: https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_messaging  
  -- tests use Connection-based and Connectionless messaging  
  -- any data written to stdout by native apps is interpreted as JSON and generates extension error messages if not well formed
  -- apptest3.js successfully implements (simple) bi-directional communication between a native nodejs app and the browser extension
  -- requires registry settings:  
  ```
    HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\MathQuestions  
      = C:\Users\chris\Code\FF Ext\cdef\native\MathQuestions.json  
```
```
    HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\nativeBat  
      = C:\Users\chris\Code\FF Ext\cdef\native\nativeBat.json  
```

Registry editing commands
---
- commands must be run from Admin console

- view subkeys:
```
> reg query HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\ /s
```

- find key:
```
> reg query HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\MathQuestions
```

- add MathQuestions.json manifest file to registry:
```
> reg add HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\MathQuestions /d "C:\Users\chris\Code\FF Ext\cdef\native\MathQuestions.json"
```

- delete a key:
```
> reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\NativeMessagingHosts\MathQuestions
```

Links   
---
  https://medium.com/front-end-weekly/   es6-modules-in-chrome-extensions-an-introduction-313b3fce955b  
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/  Native_manifests#Manifest_location  
