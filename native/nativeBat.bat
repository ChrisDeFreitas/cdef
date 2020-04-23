cls
@echo off
echo    nativeBat.bat
echo    - test calling batch file from browser extensions
echo.

rem "C:\Program Files\IDM Computer Solutions\UltraEdit\uedit64.exe"
rem .\MathQuestions.exe
node.exe ./apptest.js

echo.
echo    Done.

EXIT 0