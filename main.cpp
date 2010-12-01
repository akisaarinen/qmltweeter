#include <QApplication>
#include <QtDeclarative>
#include <QDeclarativeView>
#include <QDeclarativeContext>

#include "settingspersistor.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSettings settings("qmltweeter.conf", QSettings::IniFormat);
    settings.sync();

    QDeclarativeView view;
    QDeclarativeContext *context = view.rootContext();

    SettingsPersistor settingsPersistor(context, &settings);
    context->setContextProperty("settings", &settingsPersistor);

    QString searchTerm = settings.value("searchTerm", QString("meego")).toString();
    context->setContextProperty("searchTerm", QVariant::fromValue(searchTerm));

    view.setSource(QUrl("qrc:///qml/qmltweeter.qml"));

    QObject *rootObject = dynamic_cast<QObject*>(view.rootObject());
    QObject::connect(&settingsPersistor, SIGNAL(settingsSaved(QVariant)), rootObject, SLOT(settingsSaved(QVariant)));

    view.show();



    return app.exec();
}
