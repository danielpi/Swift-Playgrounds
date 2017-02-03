// Automatic Reference Counting

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
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
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment #\(unit) is being deinitialized") }
}

var john: Person2?
var unit4A: Apartment?

john = Person2(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

//  Unfortunately, linking these two instances creates a strong reference cycle between them. The Person instance now has a strong reference to the Apartment instance, and the Apartment instance has a strong reference to the Person instance. Therefore, when you break the strong references held by the john and number73 variables, the reference counts do not drop to zero, and the instances are not deallocated by ARC:

john = nil
unit4A = nil
// We have now leaked memory

// Resolving Strong Reference Cycles between Class Instances
//  Use a weak reference whenever it is valid for that reference to become nil at some point during its lifetime. Conversely, use an unowned reference when you know that the reference will never be nil once it has been set during initialization.

// Weak References
class Person3 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment3?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment3 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person3?
    deinit { print("Apartment #\(unit) is being deinitialized") }
}

var james: Person3?
var number74: Apartment3?

james = Person3(name: "James Appleseed")
number74 = Apartment3(unit: "74")

james!.apartment = number74
number74!.tenant = james

james = nil
number74 = nil

// Unowned References
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var justin: Customer?
justin = Customer(name: "Justin McIntyre")
justin!.card = CreditCard(number: 1234_5678_9012_3456, customer: justin!)
justin = nil


// Unowned References and Implicitly Unwrapped Optional Properties
//  Both properties should always have a value, and neither property should ever be nil once initialization is complete. This enables both properties to be accessed directly (without optional unwrapping) once initialization is complete, while still avoiding a reference cycle.

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
//  The initializer for City is called from within the initializer for Country. However, the initializer for Country cannot pass self to the City initializer until a new Country instance is fully initialized, as described in Two-Phase Initialization. To cope with this requirement, you declare the capitalCity property of Country as an implicitly unwrapped optional property, indicated by the exclamation mark at the end of its type annotation (City!). This means that the capitalCity property has a default value of nil, like any other optional, but can be accessed without the need to unwrap its value.
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


// Strong Reference Cycles for Closures
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())


var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
//  Unfortunately, the HTMLElement class, as written above, creates a strong reference cycle between an HTMLElement instance and the closure used for its default asHTML value. 
paragraph = nil
//  Note that the message in the HTMLElement deinitializer is not printed, which shows that the HTMLElement instance is not deallocated.

// Resolving Strong Reference Cycles for Closures
/*
@lazy var someClosure: (Int, String) -> String = {
    [unowned self] (index: Int, stringToProcess: String) -> String in
    // Closure body goes here
}
*/

class HTMLElement2 {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
print(paragraph2!.asHTML())

paragraph2 = nil
// prints "p is being deinitialized"

















