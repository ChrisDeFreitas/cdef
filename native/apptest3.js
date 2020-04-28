/*
    apptest3.js
    - returns pong when ping is received
    - purpose is to test browser extension communicating with a native app
    - code based on:
    https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_messaging

*/

/* this works too, returns message sent from browser:
process.stdin.pipe(process.stdout);
*/


let payloadSize = null;
var msgbody = null

// A queue to store the chunks as we read them from stdin.
// This queue can be flushed when `payloadSize` data has been read
let chunks = [];

// Only read the size once for each payload
const sizeHasBeenRead = () => Boolean(payloadSize);

// All the data has been read, reset everything for the next message
const flushChunksQueue = () => {
    payloadSize = null;
    chunks.splice(0);
};

const processData = () => {
    // Create one big buffer with all all the chunks
    const byteString = Buffer.concat(chunks);

    // The browser will emit the size as a header of the payload,
    // if it hasn't been read yet, do it.
    // The next time we'll need to read the payload size is when all of the data
    // of the current payload has been read (ie. data.length >= payloadSize + 4)
    if (!sizeHasBeenRead()) {
        payloadSize = byteString.readUInt32LE(0);
    }



    // If the data we have read so far is >= to the size advertised in the header,
    // it means we have all of the data sent.
    // We add 4 here because that's the size of the bytes that old the payloadSize
    if (byteString.length >= (payloadSize + 4)) {
        // Remove the header
        msgbody = byteString.slice(4, byteString.length)
        
        //return msg
        let ss = msgbody.toString('utf8')
        if(ss[0] === '"')
            ss = ss.substring(1, ss.length -1)      //trim quotes
        let msgbody2 = (ss=='ping' ?`"pong"` :`"Native app received unknown message: [${ss}]."`)
        let sz = msgbody2.length
        let byteString2 = Buffer.alloc(sz +4, 0, )
        byteString2.writeUInt32LE(sz, 0, 'utf8')
        byteString2.write(msgbody2, 4)
        
        const fs = require('fs');
        fs.appendFileSync('./apptest3.out.txt', '\n\n=\n'
            +byteString.toString('utf8') +'\n'
            +byteString.length +'\n'
            +'payloadSize: ' +payloadSize +'\n'
            +msgbody2 +'\n'
            +byteString2.toString('utf8') +'\n'
            +byteString2.length +'\n'
            +'payloadSize2: ' +sz +'\n'
            + ss
        )

        process.stdout.write( byteString2.toString('utf8') )
        // process.stdout.write( byteString.toString('utf8') )

        // Reset the read size and the queued chunks
        flushChunksQueue();
    }
};

process.stdin.on('readable', () => {
    // A temporary variable holding the nodejs.Buffer of each
    // chunk of data read off stdin
    let chunk = null;

    // Read all of the available data
    while ((chunk = process.stdin.read()) !== null) {
        chunks.push(chunk);
    }

    processData();

});

