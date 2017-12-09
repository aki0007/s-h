--Funkcija za inicijaliziranje objekta Airplane + ispis
function airplane_init(id)
  local Airplane = {}
    Airplane.id = id
    Airplane.park_id = 0
  function Airplane:report()
    print("Plane " .. Airplane.id .. " has parking slot " .. Airplane.park_id)
  end
    
  return Airplane
end
  
  
 --Funkcija za inicijaliziranje objekta Parking + ispis 
function parking_init(id)  
  local Parking = {}
    Parking.id = id
    Parking.status = "epty"
    
  function Parking:report()
    print("Parking spot " .. Parking.id .. " is " .. Parking.status)
  end

  return Parking
end


--Funkcija za parkiranje aviona
--U .py fileu sam ovde ima provjeru, a kako se u funkciji assign_parking vec vrsi provjera ova je bila visak
function park_plane(airplane_list, parking_list)
  for i, plane in ipairs(airplane_list) do
     assign_parking(plane, parking_list)
      print(plane:report())
  end
end  


--Funkcija za dodjeljivanje random mjesta avionu
--U .py file-u nije bilo moguce generirati random broj koji je vec bio definiran
--U ovoj funkciji je to moguce i ako je izgeneriran vec pridodati broj ispisat ce se poruka
function assign_parking(plane, parking_list)
  temp = math.random(1,100)
  parking = parking_list[temp]
    --Provjera da li su parkirna mista zauzeta
    if (parking.status == "taken") then
        print ("Parking " .. temp .. " has already been assigned")
        assign_parking(plane, parking_list)

  else
      plane.park_id = parking_list[temp].id
      parking.status = "taken"
    end
end


--Main
airplane_list = {}
parking_list = {}

for i = 0, 80 do
  airplane_list[i] = airplane_init(i)  
end

for i = 0, 100 do
  parking_list[i] = parking_init(i)  
end

park_plane(airplane_list, parking_list)

for i, park in ipairs(parking_list) do
   print (park:report())
end










