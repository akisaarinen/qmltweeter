#include <QApplication>
#include <QSettings>
#include "qmltweetermainview.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSettings settings("qmltweeter.conf", QSettings::IniFormat);
    settings.sync();

    QmlTweeterMainView mainView(&settings);
    mainView.show();

    return app.exec();
}
