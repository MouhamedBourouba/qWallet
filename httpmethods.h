#ifndef HTTPMETHODS_H
#define HTTPMETHODS_H

#include <QNetworkAccessManager>



class HttpMethods : public QObject
{
    Q_GADGET

public:
    explicit HttpMethods(QObject *parent = nullptr);

    QNetworkReply *preformPOST(QUrl url, QByteArray requestBody);
    QNetworkReply *performGET(QUrl url);


private:
    QNetworkAccessManager* manager;
};

#endif // HTTPMETHODS_H
