import random

#Klasa avion
class Airplane:
    def __init__(self, id):
        self.id = id
        self.park_id = 0

    def print_plane(self):
        print ("Plane "+ str(self.id) + " has parking slot " + str(self.park_id))

#Klasa parking
class Parking:
    def __init__(self, id):
        self.id = id
        self.status = "empty"

    def print_parking(self):
        print ("Parking spot " + str(self.id) + " is " + self.status)

#Parkiranje aviona
def park_plane(airplane_list, parking_list, houndred_list):
    for plane in airplane_list:
        if plane.park_id == 0:
            assign_parking(plane, parking_list, houndred_list)
            plane.print_plane()
        else:
            print ("Airlplane " + str(plane.id) + " already has parking slot " + str(plane.park_id))

#Dodjeljivanje random broja parkinga avionu
def assign_parking (plane, parking_list, houndred_list):
    temp =  random.choice(houndred_list)
    index = houndred_list.index(temp)
    houndred_list.pop(index)

    #Provjera da li su parkirna mista zauzeta
    if (parking_list[temp].status == "taken"):
        assign_parking(plane, parking_list, houndred_list)
        return
    plane.park_id = parking_list[temp].id
    parking_list[temp].status = "taken"

#main
if __name__ == "__main__":
    airplane_list = []
    parking_list = []
    hundred_list = []

    #Dodavanje liste objekata
    for i in range (0,80):
        plane = Airplane(i+1)
        airplane_list.append(plane)

    #Dodavanje liste objekata i liste intigera
    for i in range (0,100):
        park = Parking(i+1)
        parking_list.append(park)
        hundred_list.append(i)

    #Dodjeljivanje random broja iz liste houndred avionu
    park_plane(airplane_list, parking_list, hundred_list)

    #Druga provjera da li je parking zauzet
    park_plane(airplane_list, parking_list, hundred_list)

    for park in parking_list:
        park.print_parking()

    #Ispis praznih parkinga
    print("Empty parking slots are: " + str(hundred_list))