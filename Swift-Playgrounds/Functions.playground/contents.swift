// Functions Chapter

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
print(sayHello("Anna"))
print(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
    return "Hello, " + personName + "!"
}
print(sayHelloAgain("Anna"))


// Function Parameters and Return Values
// Multiple Input Parameters
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(1, end: 10))

// Functions Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// Functions Without Return Values
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello, world")
printWithoutCounting("hello, world")

// Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


// Function Parameter Names
// External Parameter Names
func someFunction(externalParameterName localParameterName: Int) -> Int {
    return localParameterName
}

func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}
join("hello", s2: "world", joiner: ", ") // Parameter meanings are not clear

func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
join(string: "Hello", toString: "World", withJoiner: ", ")

// Shorthand External Parameter Names
func containsCharacter(string string: String, characterToFind: Character) -> Bool {
    for character in string.characters {
        if character == characterToFind {
            return true
        }
    }
    return false
}
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")


// Default Parameter Values
func joinAgain(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}
joinAgain(string: "hello", toString: "world", withJoiner: "-")
joinAgain(string: "hello", toString: "world")


// External Names for Parameters with Default Values
func joinOnceMore(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}
joinOnceMore("hello", s2: "world", joiner: "-")

// Variadic Parameters
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8, 19)


// Constant and Variable Parameters
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - count(string)
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, count: 10, pad: "-")


// In-Out Parameters
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// Function Types
//  Every function has a specific function type, made up of the parameter types and the return type of the function.
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("hello, world")
}

//  you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

// Function Types as Parameter Types
func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, a: 3, b: 5)

// Function Types as Return Types
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// Nested Functions
func chooseAnotherStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
currentValue = -4
let moveNearerToZeroAgain = chooseAnotherStepFunction(currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZeroAgain(cur