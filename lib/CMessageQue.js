/*

CMessageQue.js
- generic message que
- basic idea: call functions with unique identifires

usage:

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

*/
"use strict"

class MessageQue {
    que = {}        //a list of keys

    constructor(options = {}){

        let que =( options.items ?options.items :[] )
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

        console.log('this.handlers', this.handlers)
        let key = this.que[ handler.key ]

        if(key[ handler.type ] === undefined)
            key[ handler.type ] = []
        key[ handler.type ].push( handler )

        if( this.onAdd !== null){
            try{
                this.onAdd(handler, obj, this)
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
            return null
        
        let list = obj[ msg.type ]
        if(list == null) 
            return null

        try{
            for(let ii = 0; ii < list.length; ii++){
                let handler = list[ ii ]
            //if( handler.cb === undefined) throw "CMessageQue.post() error, handler.cb is undefined"

                let result = false
                if( this.onPost !== null)
                    result = this.onPost(handler, this)
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