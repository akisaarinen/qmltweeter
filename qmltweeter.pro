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
    settingspersistor.cpp

HEADERS  += \
    settingspersistor.h

FORMS    +=

OTHER_FILES += \
    qml/qmltweeter.qml \
    qml/SearchModel.qml \
    qml/SearchModelTest.qml \
    qml/ThrottledTextInput.qml \
    qml/ThrottledTextInputTest.qml \
    qml/TweetView.qml \
    qml/TweetViewTest.qml

RESOURCES += \
    res.qrc
