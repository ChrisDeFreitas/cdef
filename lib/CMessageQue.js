/*

CMessageQue.js
- generic message que
- basic idea: call functions with unique identifiers

features
- this.add( handler ) = add message handlers
- this.post( message ) = post message

- handler.type = message.type
- handler.key = message.to

- this.que = {
    msgkey_n: [ handler, ... ],
    ...
 }
 - a msgkey is a grouping of message handlers
 -- ??? this allows a message recipient to have multiple message handlers
 - msgkey = this.que[ handler.type || message.type ]
 - handler = msgkey[ n ]


usage:

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

*/
"use strict"

class MessageQue {
    que = {}        //a list of keys

    constructor(options = {}){

        let que =( options.que ?options.que :[] )
        if(typeof( que ) === 'string')
            que = JSON.decode( que )

        //if( options.id === undefined) options.id = ui.calc.timeStamp()
        if( options.onAdd === undefined) options.onAdd = null
        if( options.onPost === undefined) options.onPost = null

        this.onAdd = options.onAdd
        this.onPost = options.onPost
      //this.id = options.id

        for( let ii = 0; ii < que.length; ii++){
            this.add( que[ii] )
        }
    }

    add( handler = null ) {
        if( handler === null) return 0
        
        if( handler.cb === undefined) throw "CMessageQue.Add() error, handler.cb is undefined"
        if( handler.customData === undefined) handler.customData = ''
        handler.handler = 'MessageQue'
        //handler.handleID = ui.calc.timeStamp()
        if( handler.key === undefined) handler.key = 'public'
        if( handler.type === undefined) throw "CMessageQue.Add() error, handler.type is undefined"

        if(this.que[ handler.key ] == undefined)
            this.que[ handler.key ] = {}

        let key = this.que[ handler.key ]
        if(key[ handler.type ] === undefined)
            key[ handler.type ] = []
        key[ handler.type ].push( handler )

        if( this.onAdd !== null){
            try{
                this.onAdd(handler, key, this)
            }
            catch(error){
                throw new Error(`MessageQue.add() error with handler.type=[${handler.type}]: [${error.message}].`)
            }
        }
    }
    post( msg ){
        if(msg === null) return 0

        if( msg.data === undefined) msg.data = ''
        if( msg.from === undefined) throw "CMessageQue.post() error, msg.from is undefined."
        if( msg.to === undefined) msg.to = 'public'
        if( msg.type === undefined) throw "CMessageQue.post() error, msg.type is undefined."
        
        msg.handler = 'MessageQue'
        //msg.handled = ui.calc.timeStamp()

        let key = this.que[ msg.to ]
        if(key == null) 
            throw new Error(`MessageQue.post() error, msg.to=[${msg.to}] not found in que.`)

        let list = key[ msg.type ]
        if(list == null) 
            throw new Error(`MessageQue.post() error, msg.type not found in key=[${msg.to}].`)
            
        // console.log('MessageQue.post()', list)
        try{
            for(let ii = 0; ii < list.length; ii++){
                let handler = list[ ii ]
              //if( handler.cb === undefined) throw "CMessageQue.post() error, handler.cb is undefined"

                let result = false
                if( this.onPost !== null)
                    result = this.onPost(msg, handler)
                if(result === false)
                    handler.cb(msg)
            }
        }
        catch(error){
            throw new Error(`MessageQue.post() error with [${msg.type}], ${error.message}`)
        }
    }
}



console.log(`mq.init`)