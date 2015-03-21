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
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retreive the number of rooms.")
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
        println("The number of rooms is \(numberOfRooms)")
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


// Calling Properties Through Optional Chaining
let jack = Person2()
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retreive the number of rooms.")
}


// Calling Methods through Optional Chaining
if jack.residence?.printNumberOfRooms() != nil {
    println("It was possible to print the number of rooms.")
} else {
    println("It was not possible to print the number of rooms.")
}
// printNumberOfRooms returns Void? if called on an optional parent value


// Calling Subscripts Through Optional Chaining
if let firstRoomName = jack.residence?[0].name {
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}

let jacksHouse = Residence2()
jacksHouse.rooms += [Room(name: "Living Room")]
jacksHouse.rooms += [Room(name: "Kitchen")]
jack.residence = jacksHouse

if let firstRoomName = jack.residence?[0].name {
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}


// Linking Multiple levels of Chaining
if let jacksStreet = jack.residence?.address?.street {
    println("Jack's street name is \(jacksStreet).")
} else {
    println("Unable to retrieve the address.")
}

let jacksAddress = Address()
jacksAddress.buildingName = "The Larches"
jacksAddress.street = "Laurel Street"
jack.residence!.address = jacksAddress

if let jacksStreet = jack.residence?.address?.street {
    println("Jack's street name is \(jacksStreet).")
} else {
    println("Unable to retrieve the address.")
}


// Chaining on Methods With Optional Return Values
if let buildingIdentifier = jack.residence?.address?.buildingIdentifier() {
    println("Jack's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = jack.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        println("Jack's building identifier begins with \"The\".")
    } else {
        println("Jack's building identifier does not begin with \"The\".")
    }
}






