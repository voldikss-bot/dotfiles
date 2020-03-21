QT       += core gui sql webkitwidgets printsupport

TARGET   = %FDIR%
TEMPLATE = app

CONFIG += c++11


SOURCES += \
    main.cpp \
    mainwindow.cpp \

HEADERS += \
    mainwindow.h \

FORMS += \
    mainwindow.ui \

RESOURCES += \
    resource.qrc \
    qss.qrc
