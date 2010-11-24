#include <QApplication>
#include <QtDeclarative>
#include <QDeclarativeView>
#include <QDeclarativeContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QDeclarativeView view;
    QDeclarativeContext *context = view.rootContext();
    context->setContextProperty("backgroundColor",
                                QColor(Qt::yellow));

    view.setSource(QUrl("qrc:///qml/qmltweeter.qml"));
    view.show();

    return app.exec();
}
