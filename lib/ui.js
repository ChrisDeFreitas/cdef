"use strict";
//"background/dlgFactory.js", "background/videoDl.js", "sidebar/panel.js", 
var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

    // not accessible:
    //  sidebar.ping('ui')
    videoDl.ping('ui')
    // browser.runtime.sendMessage({
    //     sender:'ui',
    //     to: 'sidebar',
    //     type: 'ping',
    //     data:' sent from ui'
    // });

    // let testHandler = {
    //     id: 'public'
    //     type:'ping',
    //     cb: function( msg ){
    //         console.log(' message handler called with: ', msg)
    //     }
    // }
    
    // var mq = new MessageQue({
    //     handlers:[testHandler])
    // })
    
    // let msg = {
    //    to:'public'
    //    type:'ping',
    // }
    // mq.post( msg )

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
 
    //wait for sidebar.init
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