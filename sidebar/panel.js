/*
  panel.js
  - must be loaded via <script> to have access to panel.html DOM
*/

var sidebar = {
  id:null
}
sidebar.ping = function( sender = null ){
  console.log('sidebar.ping() from:', sender)
}


/* Update the sidebar's content.
1. display tab title in sidebar
2. if tab content from youtube.com, display tab.url for downloading
3. get youtube data
*/
function updateHeader( tab ){
  console.log('sidebar.updateHeader()', typeof cs)

  sidebar.title.value = tab.title
  let url = tab.url
  if(url.indexOf('https://www.youtube.com') !== 0){
    url = ''
  }
  sidebar.url.value = tab.url
  //videoDl.ping('sidebar')
}
function updateContent() {
  browser.tabs.query({windowId: sidebar.id, active: true})
    .then((tabs) => {

      //test messaginig api
      // message crosses backbround/page script boundary
      browser.runtime.sendMessage({
        sender:'sidebar',
        type: 'ui.ping',
        url: tabs[0].url 
      });

      //return browser.storage.local.get(tabs[0].url);
      updateHeader( tabs[0] )
    })
    // .then((storedInfo) => {
    //   //contentBox.textContent = storedInfo[Object.keys(storedInfo)[0]];
    // });
}

/*
update content when the sidebar loads, get the ID of its window,
*/
browser.windows.getCurrent({populate: true}).then((windowInfo) => {

  //init
  sidebar.id = windowInfo.id;
  sidebar.title = document.querySelector("#fld-title")
  sidebar.url = document.querySelector("#fld-url")

  updateContent();
  console.log('sidebar initted.')
});


/*
Update content when a new tab becomes active.
*/
browser.tabs.onActivated.addListener(updateContent);

/*
Update content when a new page is loaded into a tab.
*/
browser.tabs.onUpdated.addListener(updateContent);

//init
browser.runtime.onMessage.addListener( function( message ){
  if(message.handler)
  return

  switch (message.type) {
    case 'sidebar.ping': 
      message.handler = 'ui'
      console.log(`sidebar.ping message from `, message.sender)
      break
  }

  if(message.handler){
    message.handled = new Date.toLocaleString()
  }

})