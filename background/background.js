import { logMessage } from './background-module.js'
logMessage('called from Background.js')

import { getUsefulContents } from '../lib/module.js'
getUsefulContents('http://www.google.com', data =>{ console.log('getUsefulContents result:', data) })


 console.log('background.js init')