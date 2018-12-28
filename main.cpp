#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "timetracker.h"
#include "log_viewer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    TimeTracker tracker;
    log_viewer viewer;

    QQuickView view;
    view.engine()->rootContext()->setContextProperty("Tracker", &tracker);
    view.engine()->rootContext()->setContextProperty("Viewer", &viewer);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
