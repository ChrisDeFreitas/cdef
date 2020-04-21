# cdef
 Test FF extension development


- currently modfying code from to test extension functionality:
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_second_WebExtension  
    

  # Notes
  - page scripts DOM not accessible from background scripts
  
  - background scripts can not access page script DOM

  - messaging between background and page scripts to exchange data
  -- see browser.runtime.onMessage.addListener
  -- see browser.runtime.sendMessage
  