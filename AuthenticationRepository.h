#ifndef AUTHENTICATIONREPOSITORY_H
#define AUTHENTICATIONREPOSITORY_H

#include "qqmlintegration.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
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

class AuthenticationRepository : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(authStateEnum authState MEMBER m_authState NOTIFY authStateChanged)
    Q_PROPERTY(AuthUser user READ getAuthUser WRITE setAuthUser NOTIFY userChanged)

public:
    explicit AuthenticationRepository(QObject *parent = nullptr);
    enum class authStateEnum
    {
        LogedIn,
        LOADING,
        IDEL,
        ERROR,
    };
    Q_ENUM(authStateEnum)
    AuthUser getAuthUser();
    void setAuthUser(AuthUser ser);

    // Q_INVOKABLES
    Q_INVOKABLE void login();
    Q_INVOKABLE void createAccount();

signals:
    void error(QString errorMessage);
    void authStateChanged();
    void userChanged();

public slots:
    void registerRequestReadyRead();
    void loginRequestReadyRead();
private:
    authStateEnum m_authState;
    AuthUser m_user = AuthUser();
    QNetworkAccessManager* m_manager;
    QNetworkReply* m_login_reply;
    QNetworkReply* m_register_reply;

    void performPOST(QUrl url, QJsonDocument* doc);
};

#endif // AUTHENTICATIONREPOSITORY_H
