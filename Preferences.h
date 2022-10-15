#ifndef PREFERENCES_H
#define PREFERENCES_H

#include "qqmlintegration.h"
#include <QObject>
#include <qsettings.h>

class Preferences : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Preferences(QObject *parent = nullptr);
    Q_INVOKABLE void setValue(QString key, QVariant value);
    Q_INVOKABLE QVariant getValue(QString key);

private:
    QSettings m_settings;
};

#endif // PREFERENCES_H
