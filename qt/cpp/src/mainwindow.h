#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

//signals:

//public slots:
    // void OnMyButtonClicked();

private:
    //QPushButton* Button1;
    void SetupUI();
    void ConnectSignals();
    void Test();


};
#endif // MAINWINDOW_H

