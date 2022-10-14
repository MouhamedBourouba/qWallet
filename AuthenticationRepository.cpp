// when i wrote this only me and god know what i am trying to do
// now only god knows :=)

#include "AuthenticationRepository.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QNetworkReply>
#include <QNetworkReply>
#include <QThread>

AuthenticationRepository::AuthenticationRepository(QObject *parent)
    : QObject{parent}
{
    m_authState = authStateEnum::IDEL;
    m_manager = new QNetworkAccessManager(this);
    //    // https://localhost:7005/api/Authentication/CreateAcount; https://httpbin.org/post; https://localhost:7005/api/Authentication/test
}

AuthUser AuthenticationRepository::getAuthUser()
{
    return m_user;
}

void AuthenticationRepository::setAuthUser(AuthUser user)
{
    m_user = user;
    emit userChanged();
}

void AuthenticationRepository::login()
{
    qInfo() << "trying to login" << m_user.name;
}



void AuthenticationRepository::createAccount()
{
    m_authState = authStateEnum::LOADING;
    emit authStateChanged();
    qDebug() << "creating account email: " << m_user.email << " name: " << m_user.name << " password: " << m_user.password;

    QUrl url(QString("https://localhost:7005/api/Authentication/CreateAcount"));

    QJsonObject *jsonPayload = new QJsonObject();
    (*jsonPayload)["name"] = m_user.name;
    (*jsonPayload)["email"] = m_user.email;
    (*jsonPayload)["password"] = m_user.password;
    (*jsonPayload)["age"] = 157;
    (*jsonPayload)["phone"] = 244;
    QJsonDocument *doc = new QJsonDocument(*jsonPayload);
    performPOST(url, doc);
}

void AuthenticationRepository::registerRequestReadyRead()
{

    qDebug() << "register request finished";

    if(m_register_reply->error() != QNetworkReply::NoError) {
        emit error("Unknown Error");
        return;
    }

    QVariant httpCode = m_register_reply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
    qDebug() << "register succsesfuly http_code: " << httpCode.toInt();
    if(httpCode.toInt() >= 400 && httpCode.toInt() < 500) {
        qDebug() << "there is an error http code in range of [400,499]";
        auto errorMessage = QString(m_register_reply->readAll());
        emit error(errorMessage);
        return;
    }
    else if(httpCode.toInt() >= 200 && httpCode.toInt() < 500) {
        m_authState = authStateEnum::LogedIn;
        emit authStateChanged();
        return;
    }

    qDebug() << "WTF ...";
    return;
}


void AuthenticationRepository::loginRequestReadyRead()
{

}

void AuthenticationRepository::performPOST(QUrl url, QJsonDocument *doc)
{
    QNetworkRequest request = QNetworkRequest(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));

    // that sad but i have to ignore certificate verification
    QSslConfiguration conf = request.sslConfiguration();
    conf.setPeerVerifyMode(QSslSocket::VerifyNone);
    request.setSslConfiguration(conf);

    m_register_reply = m_manager->post(request, doc->toJson());
    connect(m_register_reply, &QNetworkReply::readyRead, this, &AuthenticationRepository::registerRequestReadyRead);
}
