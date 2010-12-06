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

void SettingsPersistor::setSearchTerm(QVariant searchTerm) {
    m_context->setContextProperty("searchTerm", searchTerm);
    m_settings->setValue("searchTerm", searchTerm);
}

