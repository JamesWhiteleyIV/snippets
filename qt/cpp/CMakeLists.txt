cmake_minimum_required(VERSION 3.11)

set(APP_NAME "MyQtApp")
project(${APP_NAME} LANGUAGES CXX)

if (WIN32)
    set(CMAKE_PREFIX_PATH C:/Qt/6.1.2/msvc2019_64) 
endif (WIN32)

if (UNIX)
    set(CMAKE_PREFIX_PATH /opt/Qt/6.1.2/gcc_64) 
endif (UNIX)


set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Widgets REQUIRED)

add_executable(${APP_NAME}
    src/main.cpp
    src/mainwindow.cpp
    src/mainwindow.h
)

#include(FetchContent)
#FetchContent_Declare(cpr GIT_REPOSITORY https://github.com/whoshuu/cpr.git GIT_TAG c8d33915dbd88ad6c92b258869b03aba06587ff9) # the commit hash for 1.5.0
#FetchContent_MakeAvailable(cpr)

target_link_libraries(${APP_NAME} 
    # PRIVATE cpr::cpr
    PRIVATE Qt6::Widgets 
)


