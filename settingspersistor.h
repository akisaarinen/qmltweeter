#ifndef SETTINGSPERSISTOR_H
#define SETTINGSPERSISTOR_H

#include <QObject>
#include <QVariant>

class QDeclarativeContext;
class QSettings;

class SettingsPersistor : public QObject
{
    Q_OBJECT
public:
    explicit SettingsPersistor(QDeclarativeContext *context, QSettings* settings, QObject *parent = 0);

signals:
    void settingsSaved(QVariant filename);

public slots:
    void save();

private:
    QDeclarativeContext *m_context;
    QSettings *m_settings;
};

#endif // SETTINGSPERSISTOR_H
