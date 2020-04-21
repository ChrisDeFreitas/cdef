/*
  sidebar.js
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
  console.log('sidebar.updateHeader()')

}
function updateContent() {
  browser.tabs.query({windowId: sidebar.id, active: true})
    .then((tabs) => {

      //test message api across backbround/page script boundary
      browser.runtime.sendMessage({
        sender:'sidebar',
        to: 'ui',
        type: 'ping',
        data:' sent from sidebar'
      });

      sidebar.title.value = tabs[0].title
      let url = tabs[0].url
      if(url.indexOf('https://www.youtube.com') !== 0){
        url = ''
      }
      sidebar.url.value = url
      //not accessible:
      //  videoDl.ping('sidebar')
    
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
  if(message.handler || message.to !== 'panel')
    return

  switch (message.type) {
    case 'ping': 
      message.handler = 'sidebar'
      console.log(`sidebar.ping from `, message.sender, ': ', message.data)
      break
  }

  if(message.handler){
    // message.handled = ui.calc.timeStamp()
  }

})