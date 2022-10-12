#ifndef AUTHENTICATION_H
#define AUTHENTICATION_H

#include "qqmlintegration.h"
#include <QObject>
#include <QString>
#include <QString>

struct AuthUser
{
    Q_GADGET
public:
    QString name;
    QString email;
    QString password;
    Q_PROPERTY(QString name MEMBER name)
    Q_PROPERTY(QString email MEMBER email)
    Q_PROPERTY(QString password MEMBER password)
};



class AuthenticationBackend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(authStateEnum authState MEMBER m_authState NOTIFY authStateChanged)
    Q_PROPERTY(AuthUser user READ getUser WRITE setUser NOTIFY userChanged)

public:
    explicit AuthenticationBackend(QObject *parent = nullptr);
    enum class authStateEnum
    {
        LogedIn,
        LOADING,
        IDEL,
        ERROR,
    };
    Q_ENUM(authStateEnum)


    //  slots
    QString getErrorMessage();
    AuthUser getUser() const;
    void setUser(AuthUser user);

    // Q_INVOKABLES

    Q_INVOKABLE void login();
    Q_INVOKABLE void createAccount();

signals:
    void authStateChanged();
    void userChanged();
private:
    authStateEnum m_authState = authStateEnum::IDEL;
    AuthUser m_user;

    //    authUser m_user = authUser{};
};

#endif // AUTHENTICATION_Hy
