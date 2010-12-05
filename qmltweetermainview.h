#ifndef QMLTWEETERMAINVIEW_H
#define QMLTWEETERMAINVIEW_H

#include <QMainWindow>

class QSettings;
class QDeclarativeView;
class SettingsPersistor;

class QmlTweeterMainView : public QMainWindow
{
    Q_OBJECT
public:
    explicit QmlTweeterMainView(QSettings* settings, QWidget *parent = 0);

signals:

public slots:

private:
    QDeclarativeView* view;
    SettingsPersistor* settingsPersistor;
};

#endif // QMLTWEETERMAINVIEW_H
