var ui = {
    initted: false,
}

ui.init = function(){
    if(this.initted == true) return
    this.initted = true

     console.log('ui.init:', new Date() )
}


/*

//for options example

*/
window.addEventListener('DOMContentLoaded', (event) => {
    ui.init()
    console.log('DOM fully loaded and parsed');
});

function handleClick() {
    console.log('handleClick():', new Date() )
    //browser.runtime.openOptionsPage();
}
browser.browserAction.onClicked.addListener(handleClick);
