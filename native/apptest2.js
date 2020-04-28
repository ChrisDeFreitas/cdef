/*
    apptest2.js
    - echo stdin to stdout
    - code from:
    https://nodejs.org/api/process.html#process_process_stdin

*/

// if( process.argv.length > 2 ){
//     process.stdout.write( process.argv[2]  );
//     process.exit(0)
// }

process.stdin.setEncoding('utf8');
process.stdin.on('readable', () => {
  //reads single line and a null terminator, when available 
  let chunk;
  // Use a loop to make sure we read all available data.
  while ((chunk = process.stdin.read()) !== null) {
    //warning: this executes once when reading from stdin
    process.stdout.write(`data: ${chunk}`);
  }
  process.exit(0)
});
process.stdin.on('end', () => {
  //never called?
  process.stdout.write('end');
});