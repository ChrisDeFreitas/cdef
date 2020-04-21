"use strict";
//"background/dlgFactory.js", "background/videoDl.js", "sidebar/panel.js", 
var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

    // //test basic message passing
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

    //test CMessageQue functionality:
    let msg = {
        from:'test',
        to:'public',
        type:'ping',
        data:'message data is a string'
    }
    let testHandler = {
        key: 'public',
        type:'ping',
        cb: function( msg ){
            console.log('testHandler called with: ', msg.data)
        }
    }
    var mq = new MessageQue({
        que: [testHandler],
        onPost: function( msg, handler ){        //default = null
            //handler for Browser Extentions:
            // browser.runtime.sendMessage( msg )
            return false //will run default handler.cb
        },
        onAdd: function( handler, key, AMessageQue){                    //default = null
            //handler for Browser Extentions:
            // browser.runtime.onMessage.addListener( handler )
        }
    })
    mq.post( msg )

    console.log('ui.initted', mq )
}

//init
//window.addEventListener('DOMContentLoaded', (event) => {
browser.windows.getCurrent({populate: true}).then((windowInfo) => {
        ui.init()    
});

function onError(error) {
  console.error(`Captured Error: ${error}`);
}


console.log('ui.init')