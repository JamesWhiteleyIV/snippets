# TODO:
# 1. make it so the steam games block (they are getting GAME STOPPED signal immediately because batch file finishes)
# 2. make it so you can close out of dolphin games 

import sys
import os
from PyQt5 import QtGui, QtCore, QtWidgets, QtMultimedia
import pygame 
import threading
import inputs
import time
import subprocess


IMAGE_FOLDER = r"C:\Users\james\GoogleDrive\GameLaunchers\images"
SOUND_FOLDER = r"C:\Users\james\GoogleDrive\GameLaunchers\sounds"
LAUNCHER_FOLDER = r"C:\Users\james\GoogleDrive\GameLaunchers\launchers"

ICON_SIZE = 371

'''
event.type:
    7 = joystick / trigger
    9 = joyhat motion (d-pad)
    10 = button down
    11 = button up
'''

XBONE_CONTROLLER_NAME = "Bluetooth XINPUT compatible input device"

BUTTON_A = 0
BUTTON_B = 1
BUTTON_X = 2
BUTTON_Y = 3

BUTTON_LB = 4 
BUTTON_RB = 5

BUTTON_SELECT = 6  
BUTTON_START = 7 

BUTTON_L3 = 8 
BUTTON_R3 = 9 

DPAD_N = ( 0,  1)
DPAD_E = ( 1,  0)
DPAD_S = ( 0, -1)
DPAD_W = (-1,  0)
DPAD_NEUTRAL = (0,  0)


def controllerMap(button):
    return {
            BUTTON_A: 'A', 
            BUTTON_B: 'B', 
            BUTTON_X: 'X', 
            BUTTON_Y: 'Y', 
            BUTTON_LB: 'LB', 
            BUTTON_RB: 'RB', 
            BUTTON_SELECT: 'SELECT', 
            BUTTON_START: 'START',
            BUTTON_L3: 'L3', 
            BUTTON_R3: 'R3', 
            DPAD_N: 'DPAD_N',
            DPAD_E: 'DPAD_E',
            DPAD_S: 'DPAD_S',
            DPAD_W: 'DPAD_W',
            DPAD_NEUTRAL: 'DPAD_NEUTRAL',
            }.get(button, None)



class Controller(QtCore.QObject):

    startGameSignal = QtCore.pyqtSignal()

    def __init__(self):
        super(Controller, self).__init__()
        self.gamepad = None

    def initGamepad(self):
        while self.gamepad is None:
            time.sleep(2)
            try:
                pygame.init()
                pygame.joystick.init()
                self.clock = pygame.time.Clock()
                self.gamepad = pygame.joystick.Joystick(0)
                self.gamepad.init()
                print("GAMEPAD FOUND:", self.gamepad.get_name())
            except Exception as err:
                print(err)
                pygame.joystick.quit()
        self.listen()

    def listen(self):
        while True:
            self.clock.tick(60)
            for event in pygame.event.get():
                '''
                if event.type == pygame.JOYBUTTONUP:
                    print ('UP')
                '''
                if event.type == pygame.JOYBUTTONDOWN:

                    if event.button == BUTTON_A:
                        self.startGameSignal.emit()

                elif event.type == pygame.JOYHATMOTION:
                    if controllerMap(event.value) == 'DPAD_N':
                        inputs.SendInput(inputs.Keyboard(inputs.VK_UP))
                    elif controllerMap(event.value) == 'DPAD_E':
                        inputs.SendInput(inputs.Keyboard(inputs.VK_RIGHT))
                    elif controllerMap(event.value) == 'DPAD_S':
                        inputs.SendInput(inputs.Keyboard(inputs.VK_DOWN))
                    elif controllerMap(event.value) == 'DPAD_W':
                        inputs.SendInput(inputs.Keyboard(inputs.VK_LEFT))



class GameRunner(QtCore.QObject):

    gameStartedSignal = QtCore.pyqtSignal()
    gameStoppedSignal = QtCore.pyqtSignal()

    def __init__(self):
        super(GameRunner, self).__init__()
        self.p = None

    def run(self, launcher):
        self.gameStartedSignal.emit()
        try:
            self.p = subprocess.Popen([launcher])
            finished = self.p.communicate()[0]
            while finished is not None:
                finished = self.p.communicate()[0]
                time.sleep(1)

        finally:
            self.gameStoppedSignal.emit()
            

 
class GameItem(QtWidgets.QListWidgetItem):

    def __init__(self, icon, launcher, parent=None):
        super(GameItem, self).__init__(icon, parent)
        self.launcher = launcher

    def sizeHint(self):
        s = QtCore.QSize()
        s.setHeight(ICON_SIZE)
        s.setWidth(ICON_SIZE)
        return s 


class GameContainer(QtWidgets.QListWidget):

    def __init__(self, parent=None):
        super(GameContainer, self).__init__(parent)
        self.setFlow(QtWidgets.QListView.LeftToRight)
        self.setResizeMode(QtWidgets.QListView.Adjust)
        self.setViewMode(QtWidgets.QListView.IconMode)
        self.setMovement(QtWidgets.QListView.Static)
        self.setIconSize(QtCore.QSize(ICON_SIZE, ICON_SIZE))
        #self.setStyleSheet("QListWidget::Item:Selected {border: 10px solid orange};")
        #p = self.palette()
        #p.setColor(QPalette::Highlight, Qt::red)
        #p = QtWidgets.qApp.palette()
        #p.setColor(QtGui.QPalette.Highlight, QtGui.QColor(0, 0, 0))
        self.setStyleSheet("QListWidget::Item:Selected { background: palette(Highlight) };")
        self.setFocus()

        self.gameRunning = False
        self.gameRunner = GameRunner()
        self.gameThread = QtCore.QThread()
        self.gameRunner.moveToThread(self.gameThread)
        self.gameRunner.gameStartedSignal.connect(self.gameStarted)
        self.gameRunner.gameStoppedSignal.connect(self.gameStopped)
        self.gameThread.start()
        self.menuMoveSound = QtMultimedia.QSound(os.path.join(SOUND_FOLDER, 'menuMove2.wav'))

        self.itemDoubleClicked.connect(self.startGame)

    def gameStarted(self):
        print('GAME STARTED')
        self.gameRunning = True


    def gameStopped(self):
        print('GAME STOPPED')
        self.gameRunning = False


    def startGame(self):
        if self.gameRunning:
            print('game already running, pry should have a popup here?')
            return 

        item = self.currentItem()
        launcher = item.launcher
        self.gameRunner.run(launcher)


    def register(self, game):
        foundIcon = False
        for item in os.listdir(IMAGE_FOLDER):
            if os.path.splitext(item)[0] == game:
                foundIcon = True
                icon = os.path.join(IMAGE_FOLDER, item)
                icon = QtGui.QIcon(icon)
        if not foundIcon:
            print('Icon not found for {0}'.format(game))
            return

        launcher = os.path.join(LAUNCHER_FOLDER, game+'.bat')
        if not os.path.isfile(launcher):
            print('Launcher not found for {0}'.format(game))
            return

        item = GameItem(icon, launcher)
        item.setSizeHint(item.sizeHint())
        self.addItem(item)


    def selectFirst(self):
        self.setCurrentItem(self.item(0))


class MainWindow(QtWidgets.QWidget):

    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        self.setWindowTitle('Game Launcher')
        self.mainLayout = QtWidgets.QHBoxLayout()
        self.setStyleSheet('background-image: url(./images/background1.png);')
        self.setWindowFlags(QtCore.Qt.FramelessWindowHint)
        self.gameContainer = GameContainer()


        self.controller = Controller()
        self.controllerThread = QtCore.QThread()
        self.controller.moveToThread(self.controllerThread)
        self.controllerThread.started.connect(self.controller.initGamepad)
        self.controller.startGameSignal.connect(self.gameContainer.startGame)
        self.controllerThread.start()

        self.gameContainer.register('ageOfMythology')
        self.gameContainer.register('braid')
        self.gameContainer.register('darkSouls3')
        self.gameContainer.register('dirtRally')
        self.gameContainer.register('donkeyKong')
        self.gameContainer.register('fracturedButWhole')
        self.gameContainer.register('gta5')
        self.gameContainer.register('marioKart')
        self.gameContainer.register('monsterHunter')
        self.gameContainer.register('residentEvil2')
        self.gameContainer.register('stardewValley')
        self.gameContainer.register('stickOfTruth')
        self.gameContainer.register('theWitness')

        self.gameContainer.register('power')
        self.gameContainer.selectFirst()

        self.gameContainer.itemSelectionChanged.connect(self.gameContainer.menuMoveSound.play)

        self.mainLayout.addWidget(self.gameContainer)
        self.setLayout(self.mainLayout)

        self.showFullScreen()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())




