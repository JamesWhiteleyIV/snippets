rem call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat"

rmdir /S /Q build
mkdir build
cd build
cmake ..
cmake --build .
cd ..

set PATH=%PATH%;C:\Qt\6.1.2\msvc2019_64\bin

start "" "%~dp0\build\Debug\MyQtApp.exe"
