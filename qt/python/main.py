import os
import sys
from PyQt6 import QtWidgets, QtCore, QtGui


class MyWidget(QtWidgets.QWidget):

    def __init__(self):
        super().__init__()
        btn1 = QtWidgets.QPushButton("Click me!")
        lbl1 = QtWidgets.QLabel("Hello World")

        self.layout = QtWidgets.QVBoxLayout(self)
        self.layout.addWidget(lbl1)
        self.layout.addWidget(btn1)



if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)

    widget = MyWidget()
    widget.resize(600, 400)
    widget.show()

    sys.exit(app.exec())
