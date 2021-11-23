#include "mainwindow.h"
#include <iostream>
#include <QPushButton>
//#include <cpr/cpr.h>

MainWindow::MainWindow(QWidget *parent) 
    : QMainWindow(parent)
{
    SetupUI();
    ConnectSignals();
    Test();
}

MainWindow::~MainWindow()
{
}

void MainWindow::SetupUI()
{
    QPushButton* Button1 = new QPushButton("YOOOO", this);
    Button1->setGeometry(10, 10, 80, 30);
}


void MainWindow::ConnectSignals()
{
    //CONNECT
}


void MainWindow::Test()
{
    //cpr::Response r = cpr::Get(cpr::Url{"https://github.com/whoshuu/cpr"});
    //std::cout << r.status_code << std::endl;
}
