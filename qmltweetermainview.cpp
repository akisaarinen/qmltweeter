#include "qmltweetermainview.h"

QmlTweeterMainView::QmlTweeterMainView(QWidget *parent) :
    QMainWindow(parent)
{
    setCentralWidget(&view);
}
