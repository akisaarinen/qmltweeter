#ifndef QMLTWEETERMAINVIEW_H
#define QMLTWEETERMAINVIEW_H

#include <QMainWindow>
#include <QDeclarativeView>

class QmlTweeterMainView : public QMainWindow
{
    Q_OBJECT
public:
    explicit QmlTweeterMainView(QWidget *parent = 0);

    QDeclarativeView view;

signals:

public slots:

};

#endif // QMLTWEETERMAINVIEW_H
