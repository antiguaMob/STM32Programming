###################################################################
###################################################################
QT       += core gui
QT += serialport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
TEMPLATE = app
TARGET = STM32Programming
DEPENDPATH += .
INCLUDEPATH += .
#CONFIG += release
DEFINES -= UNICODE

VERSION = 1.1
VERSTR = '\\"$${VERSION}\\"'
DEFINES += VER=\"$${VERSTR}\"
QMAKE_TARGET_PRODUCT = "STM32 BootLoader Read Writer"
QMAKE_TARGET_DESCRIPTION = "STM32 BootLoader Read Writer for Windows AND UNIX"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) 2009-2018 Yang"

CONFIG += c++11

INCLUDEPATH +=$$PWD/sdk
INCLUDEPATH +=$$PWD/sdk/include
INCLUDEPATH +=$$PWD/sdk/src

# Input
HEADERS += \
           mainwindow.h\
           elapsedtimer.h \
           sdk/include/stm32_bootloader.h \
    sdk/include/simplesignal.hpp \
    qcomcheckbox.h

FORMS += mainwindow.ui

SOURCES += \
           main.cpp\
           mainwindow.cpp\
           app.cpp \
           elapsedtimer.cpp \
           sdk/src/stm32_bootloader.cpp \
           sdk/src/serial.cpp \
           qcomcheckbox.cpp

win32{
SOURCES += \
    sdk/src/impl/windows/win_serial.cpp \
    sdk/src/impl/windows/win_timer.cpp
}

unix{
SOURCES += \
    sdk/src/impl/unix/unix_serial.cpp \
    sdk/src/impl/unix/unix_timer.cpp
}

RESOURCES += gui_icons.qrc

RC_FILE = STM32Programming.rc

