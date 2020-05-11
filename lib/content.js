/*
  content.js

  - test bi-directional communication between content script and backgroud/sidebar
*/

//init not required; script loaded when tab refreshed
//window.addEventListener('DOMContentLoaded', (event) => {

  var list = document.querySelectorAll('img')
  var imglist = []
  list.forEach( function(img){
     if(img.offsetHeight >= '300'
     || img.offsetWidth >= 300) {

      imglist.push({ 
        title:img.title,
        src:img.src,
        h:img.offsetHeight,
        w:img.offsetWidth
      })
    }
  })
  console.log(`content.js.init`, imglist)

  //test basic message passing  
  //does not work
  // window.addEventListener("message", function(event) {
  //   let message = event.data
  //   console.log(`content message event`, message)
    // if(message.handler || !message.to || message.to !== 'content')
    //   return

    // switch (message.type) {
    //   case 'ping': 
    //     message.handler = 'content'
    //     console.log(`content.ping from `, message.sender)
    //     browser.runtime.sendMessage({
    //       sender:'sidebar.js via '+message.sender,
    //       to: 'background',
    //       type: 'ping'
    //     });
    //     break
    //   case 'imgList': 
    //     message.handler = 'content'
    //     let list = document.querySelectorAll('img')
    //     console.log(`content.imgList from `, message.sender, list)
    //     break
    // }
    // if(message.handler){
    //   // message.handled = ui.calc.timeStamp()
    // }
  // });

  //this works but how to receive message here
  // browser.runtime.sendMessage({
  //   sender:'content.init',
  //   to: 'background',
  //   type: 'ping'
  // });

  //works within file can't call from background.js or sidebar.js
  // window.postMessage({
  //   sender:'content postMessage',
  //   to: 'content',
  //   type: 'ping'
  // }, "*");
  
  //connection-based messaging with content script
  var myPort = browser.runtime.connect({name:"port-from-cs"});
  myPort.postMessage({greeting: "hello from content script"});
  myPort.onMessage.addListener(function(m) {
    if(m.greeting==='imgList'){
      let data = imgList()
      console.log('imgList', data)
      browser.runtime.sendMessage({
          sender:'content',
          to: 'background',
          type: 'imgList',
          data:data
      });
    } 
    else
      console.log("Content script received message: ", m.greeting);
  });
  
  document.body.addEventListener("click", function() {
    myPort.postMessage({greeting: "they clicked the page!"});
  });

// })

function imgList(){
  let list = document.querySelectorAll('img')
  let result = []
  list.forEach( function(img){
     if(img.offsetHeight >= '300'
     || img.offsetWidth >= 300) {

      result.push({ 
        title:img.title,
        src:img.src,
        h:img.offsetHeight,
        w:img.offsetWidth
      })
    }
  })

  result = JSON.stringify(result)
  // console.log('imgList result', result)
  return result
}

console.log(`content.init`)

