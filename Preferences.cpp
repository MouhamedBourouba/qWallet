#include "Preferences.h"

Preferences::Preferences(QObject *parent)
    : QObject{parent} {}

void Preferences::setValue(QString key, QVariant value)
{
    m_settings.setValue(key, value);
}

QVariant Preferences::getValue(QString key)
{
    return m_settings.value(key, 0);
}
