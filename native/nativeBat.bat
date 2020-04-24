@echo off
rem 
rem nativeBat.bat
rem 
rem any console output is interpreted as a json message, 
rem therefore browser errors occur if non-json written to stdout

rem ./MathQuestions.exe
rem node.exe ./apptest.js
"C:/electron/Electron-FolderView/dist/FolderView-win32-x64/FolderView.exe" > ./FolderView.out.txt
