/*
 *  STM32Programming
 *
 *  Copyright 2015 - 2020 yangfuyuan
 *
 *
 */
#include "mainwindow.h"
#include <QApplication>
#include <QStyleFactory>
#include <QFile>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    a.setApplicationDisplayName(VER);
    QApplication::setStyle(QStyleFactory::create("Fusion"));
    a.setAttribute(Qt::AA_UseDesktopOpenGL);

    QFile file(":/qss/scroll.qss");
    file.open(QFile::ReadOnly);
    QString styleSheet = QString::fromLatin1(file.readAll());
    qApp->setStyleSheet(styleSheet);
    file.close();
    MainWindow w;
    w.show();
    w.move((QApplication::desktop()->width() - w.width()) / 2,
         (QApplication::desktop()->height() - w.height()) / 2);
    return a.exec();
}
