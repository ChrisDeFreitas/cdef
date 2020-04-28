"use strict";

var ui = {
    initted: false,
    mq: null,    //CMessageQue
}
var port = null

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

                //respond to sidebar's ping message
                let msg = {
                    sender:'ui',
                    to: 'sidebar',
                    type: 'ping',
                    data:' ping response from ui'
                }
                browser.runtime.sendMessage(msg) 

                break
            case 'nativeApp':           //test calling native app
                message.handler = 'ui'
                console.log(`ui.nativeApp called from `, message.sender)
                
                //Connection-based messaging
                port = browser.runtime.connectNative( "MathQuestions" )
                port.onMessage.addListener((response) => {
                    console.log("port received: " + response);
                })
                port.onDisconnect.addListener((p) => {
                    if (p.error) {
                      console.log(`port Disconnected due to an error: ${p.error.message}`);
                    }
                    else
                        console.log(`port Disconnected.`)
                    port = null
                })
                break
            case 'nativeBat':           //test calling native app
                message.handler = 'ui'
                console.log(`ui.nativeBat called from `, message.sender)

                //Connectionless messaging
                // function onResponse(response) {
                //     console.log("nativeBat Response: ", response);
                // }
                // function onError(error) {
                //     console.log(`nativeBat Error: ${error}`);
                // }
                // var sending = browser.runtime.sendNativeMessage(
                //     "nativeBat",
                //     "");
                // sending.then(onResponse, onError);

                browser.runtime.sendNativeMessage(
                    "nativeBat",
                    "sausage"                  
                )
                .then( response => console.log('nativeBat response:', response))
                .catch( error => console.error('nativeBat error:', error))
                .finally( () => console.log('nativeBat Done.'))
            break
        }
     
        // if(message.handler){
        //     message.handled = new Date().toLocaleDateString()
        // }
        
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
    let testPing = {
        key: 'public',
        type:'ping',
        cb: function( msg ){
            console.log('testPing msghandler called with msg: ', msg)
        }
    }
    this.mq = new MessageQue({
        que: [testPing],        //list of message handlers
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
    this.mq.post({
        from:'test',
        to:'public',
        type:'ping',
        data:'message data is a string'
    })

    console.log('ui.initted' )
}

//init
//window.addEventListener('DOMContentLoaded', (event) => {
browser.windows.getCurrent({populate: true}).then((windowInfo) => {
    ui.init()    
});


// fails:
//import { getUsefulContents } from './module.js';

console.log('ui.init')