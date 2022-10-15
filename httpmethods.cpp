#include "httpmethods.h"

HttpMethods::HttpMethods(QObject *parent)
{
    manager = new QNetworkAccessManager(this);
}

QNetworkReply* HttpMethods::preformPOST(QUrl url, QByteArray requestBody)
{
    QNetworkRequest* request = new QNetworkRequest(url);
    request->setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));

    // that sad but i have to ignore certificate verification
    QSslConfiguration conf = request->sslConfiguration();
    conf.setPeerVerifyMode(QSslSocket::VerifyNone);
    request->setSslConfiguration(conf);

    QNetworkReply *reply = manager->post(*request, requestBody);

    return reply;
}

QNetworkReply *HttpMethods::performGET(QUrl url)
{
    QNetworkRequest *request = new QNetworkRequest(url);
    return manager->get(*request);
}
