#include <QApplication>
#include <QtDeclarative>
#include <QDeclarativeContext>
#include "qmltweetermainview.h"

#include "settingspersistor.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSettings settings("qmltweeter.conf", QSettings::IniFormat);
    settings.sync();

    QmlTweeterMainView mainView;
    QDeclarativeView& view = mainView.view;

    QDeclarativeContext *context = view.rootContext();

    SettingsPersistor settingsPersistor(context, &settings);
    context->setContextProperty("settings", &settingsPersistor);

    QString searchTerm = settings.value("searchTerm", QString("meego")).toString();
    context->setContextProperty("searchTerm", QVariant::fromValue(searchTerm));

    view.setSource(QUrl("qrc:///qml/qmltweeter.qml"));

    QObject *rootObject = view.rootObject();
    QObject::connect(&settingsPersistor, SIGNAL(settingsSaved(QVariant)), rootObject, SLOT(settingsSaved(QVariant)));

    mainView.show();

    return app.exec();
}
