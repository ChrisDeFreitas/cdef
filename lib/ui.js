"use strict";

var ui = {
    initted: false,
    mq: null,    //CMessageQue
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
                break
            case 'nativeApp':           //test calling native app
                message.handler = 'ui'
                console.log(`ui.nativeApp called from `, message.sender)
                browser.runtime.sendNativeMessage(
                    "MathQuestions",             // string
                    "message"                  // object
                  )
                  .then( () => {
                      console.log('nativeApp then...')
                  })
                  .catch(function(error) {
                    console.error('nativeApp error:.', error);
                  })
                  .finally( () => console.log('nativeApp Done.') )
                break
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

    //test CMessageQue
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
    this.mq = new MessageQue({
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
    this.mq.post( msg )

    console.log('ui.initted', this.mq )
}

//init
//window.addEventListener('DOMContentLoaded', (event) => {
browser.windows.getCurrent({populate: true}).then((windowInfo) => {
        ui.init()    
});

function onError(error) {
  console.error(`Captured Error: ${error}`);
}

// fails:
//import { getUsefulContents } from './module.js';

console.log('ui.init')