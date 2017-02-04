// Optional Chaining

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms
// This triggers a runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retreive the number of rooms.")
}

// Defining Model Classes for Optional Chaining
class Person2 {
    var residence: Residence2?
}

class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        return rooms[i]
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if (buildingName != nil) {
            return buildingName
        } else if (buildingNumber != nil) {
            return buildingNumber
        } else {
            return nil
        }
    }
}


// Accessing Properties Through Optional Chaining
let jack = Person2()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retreive the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
jack.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

// Calling Methods through Optional Chaining
if jack.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// printNumberOfRooms returns Void? if called on an optional parent value

if (jack.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address."


// Accessing Subscripts Through Optional Chaining
if let firstRoomName = jack.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//jack.residence?[0] = Room(name: "Bathroom")
//This subscript setting attempt also fails, because residence is currently nil.


let jacksHouse = Residence2()
jacksHouse.rooms.append(Room(name: "Living Room"))
jacksHouse.rooms.append(Room(name: "Kitchen"))
jack.residence = jacksHouse

if let firstRoomName = jack.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

// Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72 // Fails as no Brian
testScores


// Linking Multiple levels of Chaining
if let jacksStreet = jack.residence?.address?.street {
    print("Jack's street name is \(jacksStreet).")
} else {
    print("Unable to retrieve the address.")
}

let jacksAddress = Address()
jacksAddress.buildingName = "The Larches"
jacksAddress.street = "Laurel Street"
jack.residence!.address = jacksAddress

if let jacksStreet = jack.residence?.address?.street {
    print("Jack's street name is \(jacksStreet).")
} else {
    print("Unable to retrieve the address.")
}


// Chaining on Methods With Optional Return Values
if let buildingIdentifier = jack.residence?.address?.buildingIdentifier() {
    print("Jack's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = jack.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Jack's building identifier begins with \"The\".")
    } else {
        print("Jack's building identifier does not begin with \"The\".")
    }
}






