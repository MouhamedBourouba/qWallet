#ifndef AUTHENTICATIONREPOSITORY_H
#define AUTHENTICATIONREPOSITORY_H

#include "httpmethods.h"
#include "qqmlintegration.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QObject>
#include <QString>

class AuthenticationRepository : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit AuthenticationRepository(QObject *parent = nullptr);

    // Q_INVOKABLES
    Q_INVOKABLE void login(QString name, QString email, QString password);
    Q_INVOKABLE void createAccount(QString email, QString name, QString password);

signals:
    void error(QString errorMessage);
    void authCompletedSuccessfully();

public slots:
    void validateRegisterRequest() { validateReply(m_register_reply).clear(); };
    void validateLoginRequest();
private:
    QNetworkAccessManager* m_manager;
    QNetworkReply* m_login_reply;
    QNetworkReply* m_register_reply;
    HttpMethods* httpMethods;
    QByteArray validateReply(QNetworkReply* reply);
};

#endif // AUTHENTICATIONREPOSITORY_H
