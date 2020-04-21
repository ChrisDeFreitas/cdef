```javascript
===
Test FF extension development
===
- currently modfying code from:  
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_second_WebExtension  
    

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


```
  