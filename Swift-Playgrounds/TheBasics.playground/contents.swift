// The Basics Chapter of “The Swift Programming Language.” iBooks. https://itun.es/au/jEUH0.l

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" // Compile time error

print(friendlyWelcome)

print("The current value of friendlyWelcome is \(friendlyWelcome)")

// this is a comment

/* this is also a comment,
but written over multiple lines*/

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment */
this is the end of the first multiline comment */

let cat = "🐱"; print(cat)

// Integers
let minValue = UInt8.min
let maxValue = UInt8.max

// Floating Point
var w = [1, 1.2]


// Type Safety and Type Inference
var meaningOfLife = 42
// inferred to be of type Int
// meaningOfLife = 35.0 //Type Error

let  pi = 3.14159
let anotherPi = 3 + 0.14159


// Numeric Literals
let descimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

//let hexFloat = 0x1234.0x5678

1.25e2
1.25e-2

0xFp2
0x8p4

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecialDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// Integer Conversion
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Integer and Floating Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
// Floats are always truncated when cast to Integers
let integerFourPointSeven = Int(4.75)
let integerNegativeThreePointNine = Int(-3.9)
// Literals can be cross type combined because they have no type until they are evaluated
3 + 0.14159


// Type Aliases
// Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source:

typealias AudioSample = UInt16
var macAmplitudeFound = AudioSample.min


// Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

// Non-Bool types can't be used for flow control
let i = 1
/*
if i {
    
}
*/
if i == 1 {
    
}


// Tuples
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// use _ if you don't want to decompose one of the values of a tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// You can access the values of the tuple using index numbers
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the elements of a tuple when it is defined
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
// “Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple. For more information”


// Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be ot type "Int?" (optional Int)

// If statements and forced Unwrapping
if (convertedNumber != nil) {
    print("\(possibleNumber) has an integer value of \(convertedNumber!)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}
// Using ! on a non-existent value triggers a runtime error

if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}

//actualNumber // THis brings up an error as the unwrapped value is only available within the if statement

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?


// Implicitly Unwrapped Optionals
// Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter. The primary use of implicitly unwrapped optionals in Swift is during class initialization

let possibleString: String? = "An optional string."
print(possibleString!)
let assumedString: String! = "An implicitly unwrapped optional string"
print(assumedString)

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}
//  Implicitly unwrapped optionals should not be used when there is a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.


// Assertions
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
// Left this out as it stops the REPL from continuing









