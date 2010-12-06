#include "qmltweetermainview.h"
#include <QtDeclarative>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QSettings>
#include "settingspersistor.h"

QmlTweeterMainView::QmlTweeterMainView(QSettings* settings, QWidget *parent) :
    QMainWindow(parent),
    view(0),
    settingsPersistor(0)
{
    view = new QDeclarativeView;
    view->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(view);
    view->setSource(QUrl("qrc:///qml/qmltweeter.qml"));

    QDeclarativeContext *context = view->rootContext();
    settingsPersistor = new SettingsPersistor(context, settings, this);
    context->setContextProperty("settings", settingsPersistor);

    QObject *rootObject = view->rootObject();
    QObject::connect(settingsPersistor, SIGNAL(settingsSaved(QVariant)), rootObject, SLOT(settingsSaved(QVariant)));
}
