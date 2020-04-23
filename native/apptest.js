/*
    apptest.js

    - test calling native nodejs apps from browser extensions
    -- may require a batch file to execute this file
*/

const fs = require('fs');

fs.mkdir('apple', { recursive: true }, (err) => {
    if (err) throw err;
});

console.log('\napptest.js done.\n')