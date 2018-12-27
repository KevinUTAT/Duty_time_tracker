#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "timetracker.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    TimeTracker tracker;

    QQuickView view;
    view.engine()->rootContext()->setContextProperty("Tracker", &tracker);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
