#include "settingspersistor.h"
#include <QDeclarativeContext>
#include <QSettings>
#include <QStringList>

SettingsPersistor::SettingsPersistor(QDeclarativeContext *context, QSettings* settings, QObject *parent) :
    QObject(parent),
    m_context(context),
    m_settings(settings)
{
}

void SettingsPersistor::save() {
    m_settings->sync();
    emit settingsSaved(m_settings->fileName());
}
