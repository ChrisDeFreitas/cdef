# cdef
 Test FF extension development


- currently modfying code from:  
  https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_second_WebExtension  
    

  # Notes
  - background scripts can not access page script DOM
  - page scripts can not access background script DOM

  - two way messaging with background and page scripts  
  -- see browser.runtime.onMessage.addListener  
  -- see browser.runtime.sendMessage  

  - create an object to manage the messaging  
  -- will also handle state  

  code:
var mq = class{

  init:function(options){}

  store:function(options = {
    from:'',
    to:'',
    type:'',

    data:'',
    
    _handler:'mq = default',
    _handled:'timestamp',
  }){

  }
}
  end
  