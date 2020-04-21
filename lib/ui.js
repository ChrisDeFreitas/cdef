"use strict";
//"background/dlgFactory.js", "background/videoDl.js", "sidebar/panel.js", 
var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

    //sidebar.ping('ui')
    videoDl.ping('ui')
    console.log('ui.init', sidebar, videoDl )
}


window.addEventListener('DOMContentLoaded', (event) => {
    ui.init()
});

function onError(error) {
  console.error(`Captured Error: ${error}`);
}

browser.runtime.onMessage.addListener( function( message ){
    if(message.handler)
        return

    switch (message.type) {
        case 'ui.ping': 
            message.handler = 'ui'
            console.log(`ui.ping message from `, message.sender)
            BroadcastChannel
    }
    
    if(message.handler){
        message.handled = new Date.toLocaleString()
    }

})