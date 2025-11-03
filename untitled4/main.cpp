#include <QGuiApplication>
#include <QQmlApplicationEngine>

//包含这两个头文件
#include <QQmlContext>
#include"myqmlclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //**********************

    //声明对象
    MyQmlClass myQmlImp;

    engine.rootContext()->setContextProperty("myQmlImp",&myQmlImp);


    //***********************




    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("untitled4", "Main");

    return app.exec();
}
