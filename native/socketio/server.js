/*
    server.js
    - socket.io nativa server
      https://socket.io/docs/
*/


const server = require('http').createServer((req, res) => {   //http server not used; required by socket.io
	res.writeHead(200)
	res.end('<h1>Hello world</h1>')
})

const io = require('socket.io')(server);

server
.on('close', () => {
    console.log('server closing')
})
.on('error', (err) => {
    // if (e.code === 'EADDRINUSE') {
    //     console.log('Address in use, retrying...');
    //     setTimeout(() => {
    //       server.close();
    //       server.listen(PORT, HOST);
    //     }, 1000);
    // }
    // else
        throw err;
})
.listen(8124, () => {
  console.log('server listening on:', server.address());
})

io.on('connection', (socket) => {
  console.log('client connected')
  socket.on('disconnect', () => {
    console.log('client  disconnected');
  })
  socket.on('event', (msg) => {   //event is a label--it could be any string
    console.log('event: ' + msg);
  })
  socket.emit('event', { hello: 'world' })
})
