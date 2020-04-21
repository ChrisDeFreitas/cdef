console.log('content_script.js')

var cs = {}
cs.ping = function(sender = null){
	console.log('content_script.ping from:', sender)
}