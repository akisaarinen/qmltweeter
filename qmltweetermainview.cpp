#include "qmltweetermainview.h"

QmlTweeterMainView::QmlTweeterMainView(QWidget *parent) :
    QMainWindow(parent)
{
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(&view);
}
