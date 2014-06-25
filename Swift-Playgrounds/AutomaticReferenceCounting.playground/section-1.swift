// Automatic Reference Counting

class Person {
    let name: String
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil
// We should see the message that the Person object has been deinitialized however due to the playground this has not occured.

// Strong Reference cycles between Classes
class Person2 {
    let name: String
    initi(name: String) { self.name = name }
    var apartment: Apartment?
}

class Apartment {
    
}

