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

  - two way messaging with background and page scripts  
  -- test code in: ui.js, sidebar.js, under "//test basic message passing"  
  -- see references:  
  --- browser.runtime.onMessage.addListener  
  --- browser.runtime.sendMessage  
  

  - create an object to manage the messaging  
  -- CMessageQue.js
  -- implemented in ui.init()

```
  