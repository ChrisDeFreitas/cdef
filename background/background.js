import { logMessage } from './background-module.js'
logMessage('Hello World from Background using modules')

import { getUsefulContents } from '../lib/module.js'
getUsefulContents('http://www.google.com',
    data => { console.log('getUsefulContents', data); });

