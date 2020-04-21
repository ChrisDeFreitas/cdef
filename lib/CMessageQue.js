/*

CMessageQue.js
- generic message que
- basic idea: call functions with unique identifires

usage:

    let testHandler = {
        id: 'public'
        type:'ping',
        cb: function( msg ){
            console.log(' message handler called with: ', msg)
        }
    }

    var mq = new MessageQue({
        handlers:[testHandler]),
        onPost: function( key, msg, handler ){        //default = null
            //handler for Browser Extentions
            // browser.runtime.sendMessage( msg )

            return true //return false will run default handler.cb
        }
        onAdd: function( handler ){                    //default = null
            //handler for Browser Extentions
            // browser.runtime.onMessage.addListener( handler )

            //return true //return false will ???
        }
    })

    let msg = {
       from:'public'
        type:'ping',
    }
    mq.post( msg )

*/
"use strict"

class MessageQue {
    handlers = {}

    constructor(options = {}){

        let handlers =( options.handlers ?options.handlers :{} )
        if(typeof( handlers ) == 'string')
            handlers = JSON.decode( handlers )

        for( let ii = 0; ii < handlers.length; ii++){
            this.add( handlers[ii] )
        }

        //if( options.id === undefined) options.id = ui.calc.timeStamp()
        if( options.onAdd === undefined) options.onAdd = null
        if( options.onPost === undefined) options.onPost = null

        //this.id = options.id
    }

    add( handler = null ) {
        if(handler === null) return 0
        
        if( handler.cb === undefined) throw "CMessageQue.handlerAdd() error, cb is undefined"

        if( handler.customData === undefined) customData.data = ''
        if( handler.id === undefined) handler.id = 'public'

        handler.handler = 'MessageQue'
      //handler.handleID = ui.calc.timeStamp()
        if(handlers[ handler.id ] == undefined)
            handlers[ handler.id ] = {}

        handlers[ handler.key ][handler.type] = handler
        if( this.onAdd !== null)
            this.onAdd(handler, this)
    }
    post( msg ){
        if(msg === null) return 0

        if( msg.data === undefined) msg.data = ''
        if( msg.from === undefined) throw "CMessageQue.post() error, msg.from is undefined."
        if( msg.to === undefined) msg.to = 'public'
        if( msg.type === undefined) throw "CMessageQue.post() error, msg.type is undefined."
      
        let obj = this.handlers[ msg.to ]
        if(obj == null) 
            return null
        let handler = obj[ msg.type ]
        if(handler == null) 
            return null

        msg.handler = 'MessageQue'
      //msg.handled = ui.calc.timeStamp()
      //if( handler.cb === undefined) throw "CMessageQue.post() error, handler.cb is undefined"

      let result = false
      if( this.onPost !== null)
        result = this.onPost(handler, this)
    
      if(result === false)
        handler.cb(msg)

    }
}



console.log(`mq.init`)