#-------------------------------------------------
#
# Project created by QtCreator 2010-11-16T13:27:15
#
#-------------------------------------------------

QT       += core gui declarative network

CONFIG += app_bundle

TARGET = qmltweeter
TEMPLATE = app

SOURCES += main.cpp \
    settingspersistor.cpp \
    qmltweetermainview.cpp

HEADERS  += \
    settingspersistor.h \
    qmltweetermainview.h

MOC_DIR = ./build
OBJECTS_DIR = ./build
RCC_DIR = ./build

FORMS    +=

OTHER_FILES += \
    qml/qmltweeter.qml \
    qml/SearchModel.qml \
    qml/SearchModelTest.qml \
    qml/TweetView.qml \
    qml/TweetViewTest.qml \
    qml/About.qml \
    qml/MainView.qml

RESOURCES += \
    res.qrc
