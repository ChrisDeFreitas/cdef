"use strict";
//"background/dlgFactory.js", "background/videoDl.js", "sidebar/panel.js", 
var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

    browser.runtime.onMessage.addListener( function( message ){
        if(message.handler || message.to !== 'ui')
            return
    
        switch (message.type) {
            case 'ping': 
                message.handler = 'ui'
                console.log(`ui.ping from `, message.sender, ': ', message.data)
        }
     
        // if(message.handler){
        //     message.handled = new Date().toLocaleDateString()
        // }
    
        //respond to sidebar's ping message
        let msg = {
            sender:'ui',
            to: 'sidebar',
            type: 'ping',
            data:' ping response from ui'
        }
        browser.runtime.sendMessage(msg)
        
    })
        
    videoDl.ping('ui')
    // not accessible:
    //  sidebar.ping('ui')
    // fails because sidebar.initted === false:
    // browser.runtime.sendMessage({
    //     sender:'ui',
    //     to: 'sidebar',
    //     type: 'ping',
    //     data:' sent from ui'
    // });

    let msg = {
        from:'test',
        to:'public',
        type:'ping',
        data:'message data is a string'
    }
    let testHandler = {
        parent: 'public',
        type:'ping',
        cb: function( msg ){
            console.log(' message handler called with: ', msg)
        }
    }
    var mq = new MessageQue({
        handlers: [testHandler],
        onPost: function( key, msg, handler ){        //default = null
            //handler for Browser Extentions:
            // browser.runtime.sendMessage( msg )
            return true //return false will run default handler.cb
        },
        onAdd: function( handler ){                    //default = null
            //handler for Browser Extentions:
            // browser.runtime.onMessage.addListener( handler )
        }
    })
    mq.post( msg )

    console.log('ui.initted', sidebar, videoDl )
}

//init
window.addEventListener('DOMContentLoaded', (event) => {
    ui.init()    
});

function onError(error) {
  console.error(`Captured Error: ${error}`);
}


console.log('ui.init')