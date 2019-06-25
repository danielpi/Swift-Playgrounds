// The Basics Chapter of “The Swift Programming Language.” iBooks. https://itun.es/au/jEUH0.l

//: # The Basics
//: ## Constants and Variables
//: ### Declaring Constants and Variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

//: ### Type Annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

//: ### Naming Constants and Variables
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" // Compile time error

//: Printing Constants and Variables
print(friendlyWelcome)

print(π, 你好, 🐶🐮, separator: ", ", terminator: "")

print("The current value of friendlyWelcome is \(friendlyWelcome)")

//: ## Comments
// this is a comment

/* this is also a comment,
but written over multiple lines*/

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment */
this is the end of the first multiline comment */

//: ## Semicolons
let cat = "🐱"; print(cat)

//: ## Integers
//: ### Integer Bounds
let minValue = UInt8.min
let maxValue = UInt8.max

//: ## Floating-Point Numbers
var w = [1, 1.2]


//: ## Type Safety and Type Inference
var meaningOfLife = 42
// inferred to be of type Int
// meaningOfLife = 35.0 //Type Error

let  pi = 3.14159
let anotherPi = 3 + 0.14159


//: ## Numeric Literals
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

//: ## Numeric Conversion
//: ### Integer Conversion
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//: ### Integer and Floating Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
// Floats are always truncated when cast to Integers
let integerFourPointSeven = Int(4.75)
let integerNegativeThreePointNine = Int(-3.9)
// Literals can be cross type combined because they have no type until they are evaluated
3 + 0.14159


//: ## Type Aliases
// Type aliases are useful when you want to refer to an existing type by a name that is contextually more appropriate, such as when working with data of a specific size from an external source:

typealias AudioSample = UInt16
var macAmplitudeFound = AudioSample.min


//: ## Booleans
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


//: ## Tuples
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


//: ## Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be ot type "Int?" (optional Int)

// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// If statements and forced Unwrapping
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}


//: ### Optional Binding

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has a value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an Int")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//: ### Implicitly Unwrapped Optionals
//: Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter. The primary use of implicitly unwrapped optionals in Swift is during class initialization

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}
//:  Implicitly unwrapped optionals should not be used when there is a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of a variable.

//: ## Error Handling
//: In contrast to optionals, which can use the presence or absence of a value to signify success or failure of a function, error handling allows you to determine the underlying cause of failure and if necessary propagate the error to another part of your program. 

func canThrowError() throws {
    // This function may or may not throw an error.
}

do {
    try canThrowError()
    // no error was thrown
} catch {
    // an error was thrown
}

enum SandwichError: Error {
    case OutOfCleanDishes
    case MissingIngredients([String])
}

func makeASandwich() throws {
    throw SandwichError.MissingIngredients(["butter","ham","bread"])
}
func eatASandwich() {
    print("yum yum yum")
}
func washDishes() {
    print("Wash the dishes")
}
func buyGroceries(ingredients: [String]) {
    ingredients.forEach{ i in print(i) }
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.OutOfCleanDishes {
    washDishes()
} catch SandwichError.MissingIngredients(let ingredients) {
    buyGroceries(ingredients: ingredients)
} catch {
    print("Why did I fail")
}

//: ## Assertions and Preconditions
//: ### Debugging with Assertions
//: Use an assertion whenever a condition has the potential to be false, but must definitely be true in order for your code to continue execution.
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
// Left this out as it stops the REPL from continuing

//: ### Enforcing Preconditions
var index = -3
precondition(index > 0, "Index must be greater than zero.")
