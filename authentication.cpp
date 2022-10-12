#include "authentication.h"

#include <QDebug>
#include <qdebug.h>

AuthenticationBackend::AuthenticationBackend(QObject *parent)
    : QObject{parent}
{

}

QString AuthenticationBackend::getErrorMessage()
{
    return "this is Error Should be displayed in front End";
}

AuthUser AuthenticationBackend::getUser() const
{
    return m_user;
}

void AuthenticationBackend::setUser(AuthUser val)
{
    m_user = val;
    emit userChanged();
}

void AuthenticationBackend::login()
{
    qInfo() << "trying to login" << m_user.name;
    m_authState = authStateEnum::LOADING;
}

void AuthenticationBackend::createAccount()
{
    qInfo() << "trying to create account" << m_user.email;
}
