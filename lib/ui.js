"use strict";
//"background/dlgFactory.js", "background/videoDl.js", "sidebar/panel.js", 
var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

    //sidebar.ping('ui')
    // videoDl.ping('ui')
    // browser.runtime.sendMessage({
    //     sender:'ui',
    //     to: 'sidebar',
    //     type: 'ping',
    //     data:' sent from ui'
    // });
    console.log('ui.init', sidebar, videoDl )
}


window.addEventListener('DOMContentLoaded', (event) => {
    ui.init()
});

function onError(error) {
  console.error(`Captured Error: ${error}`);
}

browser.runtime.onMessage.addListener( function( message ){
    if(message.handler || message.to !== 'ui')
        return

    switch (message.type) {
        case 'ping': 
            message.handler = 'ui'
            console.log(`ui.ping from `, message.sender, ': ', message.data)
            BroadcastChannel
    }
 
    videoDl.ping('ui')
    browser.runtime.sendMessage({
        sender:'ui',
        to: 'sidebar',
        type: 'ping',
        data:' sent from ui'
    });

    if(message.handler){
        message.handled = new Date().toLocaleDateString()
    }

})