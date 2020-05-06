@echo off
rem
rem nativeBat.bat
rem
rem any console output is interpreted as a message,
rem message = Uint8Array[ UInt32LE length of json message, string message]
rem therefore error if non-message written to stdout

rem echo 0
rem echo {"a":1}
rem ./MathQuestions.exe
rem call node.exe ./apptest.js
rem call node.exe ./apptest2.js
rem node.exe ./apptest3.js  %1
rem "C:/electron/Electron-FolderView/dist/FolderView-win32-x64/FolderView.exe" > ./FolderView.out.txt
electron "C:/electron/Electron-FolderView/main.js" devtools=true --path="C:/Users/chris/videos/LXDE/225445921.jpg" shuffle=true > ./FolderView.out.txt
rem echo 0