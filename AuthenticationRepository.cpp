// when i wrote this only me and god know what i am trying to do
// now only god knows :=)

#include "AuthenticationRepository.h"
#include "Preferences.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include "Constants.h"

AuthenticationRepository::AuthenticationRepository(QObject *parent)
    : QObject{parent}
{
    m_manager = new QNetworkAccessManager(this);
    httpMethods = new HttpMethods(this);
    // https://localhost:7005/api/Authentication/CreateAcount; https://httpbin.org/post; https://localhost:7005/api/Authentication/test
}

void AuthenticationRepository::login(QString name, QString email, QString password)
{
    qDebug() << "hi iam login";
    QUrl loginRequestUrl = QUrl(LOGIN_BASE_URL);

    QJsonObject* jsonPayload = new QJsonObject();
    (*jsonPayload)["name"] = name ;
    (*jsonPayload)["email"] = email;
    (*jsonPayload)["password"] = password; (*jsonPayload)["age"] = 0; (*jsonPayload)["phone"] = 0;
    QJsonDocument* doc = new QJsonDocument(*jsonPayload);
    m_login_reply =  httpMethods->preformPOST(loginRequestUrl, doc->toJson());
    connect(m_login_reply, &QNetworkReply::readyRead, this, &AuthenticationRepository::validateLoginRequest);
}

void AuthenticationRepository::createAccount(QString email, QString name, QString password)
{
    QUrl createAccountRequestUrl(CREATE_ACCOUNT_URL);

    QJsonObject *jsonPayload = new QJsonObject();
    (*jsonPayload)["name"] = name;
    (*jsonPayload)["email"] = email;
    (*jsonPayload)["password"] = password;
    (*jsonPayload)["age"] = 0;
    (*jsonPayload)["phone"] = 0;
    QJsonDocument *doc = new QJsonDocument(*jsonPayload);
    m_register_reply = httpMethods->preformPOST(createAccountRequestUrl, doc->toJson());
    connect(m_register_reply, &QNetworkReply::readyRead, this, &AuthenticationRepository::validateRegisterRequest);
}

void AuthenticationRepository::validateLoginRequest()
{
    QByteArray data = validateReply(m_login_reply);
    QJsonDocument jsonDoc = QJsonDocument::fromJson(data);
    Preferences settings;
    settings.setValue("userId" ,jsonDoc["id"]);
    settings.setValue("username" ,jsonDoc["name"]);
    settings.setValue("email" ,jsonDoc["email"]);
    settings.setValue("walletId" ,jsonDoc["walletid"]);
    settings.setValue("userPhoto" ,jsonDoc["imageUrl"]);
}

QByteArray AuthenticationRepository::validateReply(QNetworkReply *reply)
{
    qDebug() << "request finished";

    if(reply->error() != QNetworkReply::NoError) {
        qDebug() << "error: " << reply->error();
        emit error("Unknown Error");
        return NULL;
    }

    QVariant httpCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
    qDebug() << "request sent http_code: " << httpCode.toInt();

    if(httpCode.toInt() >= 200 && httpCode.toInt() < 300) {
        QByteArray data = reply->readAll();
        emit authCompletedSuccessfully();
        return data;
    }
    else if(httpCode.toInt() >= 400 && httpCode.toInt() < 500) {
        auto errorMessage = QString(reply->readAll());
        qDebug() << "there is an error http code in range of [400,499] error: " << errorMessage;
        emit error(errorMessage);
        return NULL;
    }
    else {
        emit error("Unknown Error");
        return NULL;
    }
}
