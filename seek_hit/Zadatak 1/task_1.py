import random
import sys
import os

#Klasa robot
class robo:
    def __init__(self):
        self.__x = 0
        self.__y = 0
        self.__position = "NOT_SPECIFIED"

    #Funckija za postavljanje početne pozicije
    def place (self, x, y, position):
        if ((x < 0) or (x > 5)):
            print ("x must be value from 0-5")
            return
        if ((y < 0) or (y > 5)):
            print ("y must be value from 0-5")
            return
        if((position == "EAST") or (position == "WEST") or (position == "NORTH") or (position =="SOUTH")):
            self.__x = x
            self.__y = y
            self.__position = position
        else:
            print("Invalid position value")

    #Pomicanje robota u lijevo
    def left (self):
        if (self.__position == "NOT_SPECIFIED"):
            print("Function PLACE needs to be called first")
        elif (self.__position == "EAST"):
            self.__position = "NORTH"
        elif (self.__position == "WEST"):
            self.__position = "SOUTH"
        elif (self.__position == "NORTH"):
            self.__position = "WEST"
        elif (self.__position == "SOUTH"):
            self.__position = "EAST"
        else:
            print("Invalid position")

    #Pomicanje robota u desno
    def right (self):
        if (self.__position == "NOT_SPECIFIED"):
            print("Function PLACE needs to be called first")
        elif (self.__position == "EAST"):
            self.__position = "SOUTH"
        elif (self.__position == "WEST"):
            self.__position = "NORTH"
        elif (self.__position == "NORTH"):
            self.__position = "EAST"
        elif (self.__position == "SOUTH"):
            self.__position = "WEST"
        else:
            print("Invalid position")

    #Kretanje robota
    def move(self):
        if (self.__position == "EAST"):
            if(self.__y == 0):
                print("Robot will fall")
            else:
                self.__y = self.__y - 1
        elif (self.__position == "WEST"):
            if (self.__y == 5):
                print("Robot will fall")
            else:
                self.__y = self.__y + 1
        elif (self.__position == "NORTH"):
            if (self.__x == 5):
                print("Robot will fall")
            else:
                self.__x = self.__x + 1
        elif (self.__position == "SOUTH"):
            if (self.__x == 0):
                print("Robot will fall")
            else:
                self.__x = self.__x - 1

    #Ispisivanje poruke robota
    def report(self):
        print("x = ", self.__x, ", y = " , self.__y , ", postion = " , self.__position)

    #Rastavljanje komande i korištenje predodređene radnje
    def command_init(self, command):
        if (command.startswith("PLACE")):
            splitted_commands = command.split(" ")
            if len(splitted_commands) > 1:
                place_params = splitted_commands[1].split(",")
                if len(place_params) == 3:
                    self.place(int(place_params[0]), int(place_params[1]), place_params[2])
                    splitted_commands.pop(0)
                    splitted_commands.pop(0)
            for command in splitted_commands:
                if (command == "MOVE"):
                    self.move()
                elif (command == "LEFT"):
                    self.left()
                elif (command == "RIGHT"):
                    self.right()
                elif (command == "REPORT"):
                    self.report()
        elif (command == "MOVE"):
            self.move()
        elif (command == "LEFT"):
            self.left()
        elif (command == "RIGHT"):
            self.right()
        elif (command == "REPORT"):
            self.report()

if __name__ == "__main__":
    robot = robo()
    #Testiranje Komande
    robot.command_init("PLACE 4,0,NORTH REPORT")
    robot.command_init("MOVE")
    robot.command_init("REPORT")
    #Pad robota
    robot.command_init("MOVE")
    #Nastavak kretanja nakon pada- zapad
    robot.command_init("LEFT")
    robot.command_init("MOVE")
    robot.command_init("REPORT")
    #Okretanje jug, kretanje
    robot.command_init("LEFT")
    robot.command_init("MOVE")
    robot.command_init("REPORT")
    #Okretanje istok, kretanje
    robot.command_init("LEFT")
    robot.command_init("MOVE")
    robot.command_init("REPORT")
    #Okretanje komande desno
    robot.command_init("RIGHT")
    robot.command_init("MOVE")
    robot.command_init("REPORT")
    #Robot ispise poruku da ce past, zatim na report ispise status
    robot.command_init("PLACE 0,0,EAST MOVE REPORT")
    robot.command_init("PLACE 0,0,SOUTH MOVE REPORT")
    #Kretanje u vise smjerova u jednoj komandi
    robot.command_init("PLACE 0,0,WEST MOVE MOVE RIGHT MOVE MOVE REPORT")
    #Postavaljanje krivih komandi
    robot.command_init("PLACE 6,2,EAST MOVE MOVE LEFT MOVE")
    robot.command_init("PLACE 4,6,EAST MOVE MOVE LEFT MOVE")
    robot.command_init("PLACE 3,2,NORTHEAST MOVE MOVE LEFT MOVE")