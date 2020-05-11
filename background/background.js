import { logMessage } from './background-module.js'
logMessage('called from Background.js')

//works:
//import { getUsefulContents } from '../lib/module.js'
//getUsefulContents('http://www.google.com', data =>{ console.log('getUsefulContents result:', data) })



//test basic message passing  
browser.runtime.onMessage.addListener( async function( message ){
    if(message.handler || !message.to || message.to !== 'background')
      return

    switch (message.type) {
      case 'content-ping': 
        console.log(`background.content-ping called from `, message.sender, portFromCS)
        message.handler = 'background'
        
        portFromCS.postMessage({ greeting:"Ping from background" });

        browser.notifications.create({
          "type": "basic",
          "iconUrl": browser.extension.getURL("link.png"),
          "title": "background.js "+message.type,
          "message": 'from: '+message.sender
        });  

        break
      case 'sidebar-ping': 
        message.handler = 'background'
        console.log(`background.sidebar-ping called from `, message.sender)
        browser.runtime.sendMessage({
          sender:'background',
          to: 'sidebar',
          type: 'ping'
        });      
        browser.notifications.create({
          "type": "basic",
          "iconUrl": browser.extension.getURL("link.png"),
          "title": "background.js "+message.type,
          "message": 'from: '+message.sender
        });  
        break

      case 'ping': 
        message.handler = 'background'
        console.log(`background.ping from `, message.sender)
        browser.notifications.create({
          "type": "basic",
          "iconUrl": browser.extension.getURL("link.png"),
          "title": "background.js "+message.type,
          "message": 'from: '+message.sender
        });        
        break
    }

    console.log('background.js - init')    
})


//Connection-based messaging with content script:
var portFromCS;
function connected(p) {
  console.log('background connected', p)
  portFromCS = p;

  portFromCS.postMessage({ greeting:"Greetings from background" });
}
browser.runtime.onConnect.addListener(connected);

console.log('background.js init')