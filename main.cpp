#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    app.setOrganizationName("MouhamedOrginazation");
    app.setOrganizationDomain("MouhamedOrginazation@gmail.com");
    QQmlApplicationEngine engine;
//s    QQmlContext* context = engine.rootContext();

    const QUrl url(u"qrc:/QWallet/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(QUrl::fromLocalFile("../QWallet/main.qml"));

    return app.exec();
}
