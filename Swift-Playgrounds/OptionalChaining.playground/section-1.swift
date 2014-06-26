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

