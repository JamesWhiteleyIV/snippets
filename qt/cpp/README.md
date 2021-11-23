# Ubuntu 20.04

## Setup

**install cmake**
```
sudo apt install cmake
```

**install Qt and its requirements** 
```
sudo apt-get install build-essential libgl1-mesa-dev
```
**go here to download installer since Qt6 is not on apt-get as of writing this: 
https://www.qt.io/download-qt-installer**
```
cd ~/Downloads/ 
chmod +x qt-unified-linux-x64-4.1.1-online.run
sudo ./qt-unified-linux-x64-4.1.1-online.run
```

**Installation options:**
- Latest Release
- Qt -> Qt 6.1.2 -> Desktop gcc 64-bit
- Qt -> Qt 6.1.2 -> Qt Debug Information Files
- Qt -> Developer and Designer Tools -> CMake 3.19.0
- Qt -> Developer and Designer Tools -> Ninja 1.10.0

**Use CMake over QMake**
Notice in CMakeLists.txt the following line, which is required to compile Qt app
using CMake:
```
set(CMAKE_PREFIX_PATH /opt/Qt/6.1.2/gcc_64) 
```

## Build and Run Application
```
cd cpp
chmod +x ./build.sh
./build.sh
```


# Windows 10

## Setup
**install cmake**
- grab the latest MSI installer here: https://cmake.org/download/

**go here to download Qt6 installer: https://www.qt.io/download-qt-installer**
- Run the .exe installer

**Installation options:**
- Latest Release
- Qt -> Qt 6.1.2 -> MSVC 2019 64-bit
- Qt -> Qt 6.1.2 -> MinGW 8.1.0 64-bit
- Qt -> Qt 6.1.2 -> Qt Debug Information Files
- Qt -> Developer and Designer Tools -> Qt Creator 4.15.2 CDB Debugger Support
- Qt -> Developer and Designer Tools -> Debugging Tools for Windows
- Qt -> Developer and Designer Tools -> CMake 3.19.2 64-bit
- Qt -> Developer and Designer Tools -> Ninja 1.10.0

**Use CMake over QMake**
Notice in CMakeLists.txt the following line, which is required to compile Qt app
using CMake:
```
set(CMAKE_PREFIX_PATH C:/Qt/6.1.2/msvc2019_64) 
```

## Build and Run Application
```
cd cpp
./build.bat
```

