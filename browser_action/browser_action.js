/*
  browser_action.js
  - must be loaded via <script> to have access to browser_action's DOM

  - content specific to test cases
*/

var browser_action = {
    id:null,
    title:null,
    url:null
}
browser_action.ping = function( sender = null ){
  console.log('browser_action.ping() from:', sender)
}


/* Update the browser_action's content.
1. display tab title in browser_action
2. if tab content from youtube.com, display tab.url for downloading
3. get youtube data
*/
function updateHeader( tab ){
  console.log('browser_action.updateHeader()')

}
function updateContent() {
  browser.tabs.query({windowId: browser_action.id, active: true})
    .then((tabs) => {

        browser_action.title.value = tabs[0].title
      let url = tabs[0].url
      if(url.indexOf('https://www.youtube.com') !== 0){
        url = ''
      }
      browser_action.url.value = url
      //not accessible:
      //  videoDl.ping('browser_action')

      //return browser.storage.local.get(tabs[0].url);
      updateHeader( tabs[0] )
    })
    // .then((storedInfo) => {
    //   //contentBox.textContent = storedInfo[Object.keys(storedInfo)[0]];
    // });
}

var port = 0


//init
browser.windows.getCurrent({populate: true})
.then((windowInfo) => {
  //get the ID of its window
  browser_action.id = windowInfo.id;
  browser_action.title = document.querySelector("#fld-title")
  browser_action.url = document.querySelector("#fld-url")

  //test calling background message handler
  document.querySelector('#btnPing').addEventListener('click', function(event){
    console.log('browser_action.btnPingClick()', event)
    browser.runtime.sendMessage({
      sender:'browser_action.btnPingClick',
      to: 'ui',
      type: 'ping',
      data:' sent from browser_action.btnPingClick()'
    });
  })

  //socket.io native app communications  
  document.querySelector('#btnSocket').addEventListener('click', function(event){
    console.log('browser_action.btnSocketClick()', event)

    var socket = io('ws://127.0.0.1:8124')
    socket.on('connect', function(){
      console.log('socket connect')
    })
    socket.on('event', function(data){
      console.log('socket event:', data)
      socket.disconnect()
    })
    socket.on('disconnect', function(){
      console.log('socket disconnect')
    })
    socket.emit('event', 'Hello')
  })

  //test calling native batch file
  let btn = document.querySelector('#btNativeBat')
  btn.addEventListener('click', function(event){
    console.log('browser_action.btnNativeBat() test', event)

    //Connection-based messaging
    //  must be called from background script  (such as background.js) for native app to stay on screen
    port = browser.runtime.connectNative( "nativeBat" )
    port.onMessage.addListener((response) => {
        console.log("port received: ", response)
        port.disconnect()
        console.log('disconnecting')
    })
    port.onDisconnect.addListener((p) => {
        if (p.error)
          console.log(`port Disconnected due to an error: ${p.error.message}`);
        else
            console.log(`port Disconnected.`)
        port = null
    })
    port.postMessage('ping')
  })

  //test calling native app
  btn = document.querySelector('#btNativeApp')
  btn.addEventListener('click', function(event){
    console.log('browser_action.btNativeApp()', event)

    browser.runtime.sendMessage({
      sender:'browser_action.btNativeApp',
      to: 'ui',
      type: 'nativeApp',
      data:' sent from browser_action.btNativeApp()'
    });
  })

  //test basic message passing
  browser.runtime.onMessage.addListener( function( message ){
    if(message.handler || message.to !== 'browser_action')
      return

    switch (message.type) {
      case 'ping':
        message.handler = 'browser_action'
        console.log(`browser_action.ping from `, message.sender, ': ', message.data)
        break
    }

    if(message.handler){
      // message.handled = ui.calc.timeStamp()
    }
  })
  browser.runtime.sendMessage({
    sender:'browser_action',
    to: 'ui',
    type: 'ping',
    data:' sent from browser_action'
  });

  // //update content when the browser_action loads
  updateContent();

  console.log('browser_action initted.')
})


//fails:
//import { getUsefulContents } from '../lib/module.js';

console.log(`browser_action.init`)