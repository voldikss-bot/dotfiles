QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

TARGET   = %FDIR%

TEMPLATE = app

SOURCES += \
    src/main.cpp \
    src/mainwindow.cpp

HEADERS += \
    src/mainwindow.hpp

FORMS += \
    src/mainwindow.ui

RESOURCES += \
    src/resource.qrc \
    src/qss.qrc
