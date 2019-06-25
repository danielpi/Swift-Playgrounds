// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, world!"


// Simple Values
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
// Experiment - Create a constant with an explicit type of Float and a value of 4.
let explicitFloat: Float = 4

// Values are never implicitly converted to another type.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// Experiment - Try removing the conversion to String from the last line. What error do you get?
// let widthLabel2 = label + width // Binary operation '+' cannot be applied to operands of type 'String and 'Int'

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
// Experiment - Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let π: Float = 3.14
let name = "Peter Pie"
let piePy = "\(name) likes the number \(π)"

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// Arrays and Dictionaries
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic",
    ]
occupations["Jayne"] = "Public Relations"
occupations

// Initialising an empty array or dict
let emptyArray = [String]()
var emptyDictionary = [String: Float]()

shoppingList = []
emptyDictionary = [:]


// Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore


// Optionals
// Normal values cannot be nil. They must have a valid value. Sometimes you may not have
// a valid value. In this case you can use an optional type. They are values that can either
// hold a valid value or nil.
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
//optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting += ", \(name)"
} else {
    greeting
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting: String = "Hi \(nickName ?? fullName)"


// Switches
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let _ = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let _ = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let _ = "Is it a spicy \(x)?"
default:
    let _ = "Everything tastes good in soup."
}
// if default: is removed we get the error "Switch must be exhaustive". This means that every
// possible option must be included in the switch/case statement so that the result cannot be 
// undefined.


// for-in loop (Also tuples)
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
"Fibonacci": [1,1,2,3,5,8],
   "Square": [1,4,9,16,25],
]
var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
largest
largestKind


// while and do-while loops
var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m * 2
} while m < 100
m

// Indexes in loops and the Range operators
var total = 0
for i in 0..<4 {
    total += i
}
total



// Functions and Closures
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

//Experiment - Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
func greet(person: String, special: String) -> String {
    return "Hello \(person), todays lunch special is: \(special)"
}
greet(person: "Bob", special:"Chicken Parmigiana")

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


// Use a tuple to make a compound value - for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
statistics.sum
statistics.2

// A variable number of arguments can be accepted by a function. They are collected into an array for use within the function.
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

// Experiment - Write a function that calculates the average of its arguments.
func meanOf(numbers: Int...) -> Double {
    var sum = 0
    for number in numbers {
        sum += number
    }
    let mean = Double(sum) / Double(numbers.count)
    return mean
}
meanOf(numbers: 42, 597, 12)
// This is a bit poor. The variable number of arguments being converted into an array means that you can't pass them onto another function. In meanOf above I was unable to reuse sumOf because numbers was an array and sumOf can't accept an array input

// Functions can be nested
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y = y + 5
    }
    add()
    return y
}
returnFifteen()

//  Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Closures
// Use the keyword "in" to seperate the parameters from the body
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
// Experiment - Rewrite the closure to return zero for all odd numbers.
numbers.map({ (number:Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
})

// Single statement closures implicitly return the value of their only statement
let mappedNumbers = numbers.map({ number in 3 * number})
mappedNumbers

// A closure passed as the last argument to a function can appear immediately after the parentheses
let sortedNumbers = numbers.sorted { $0 > $1 }
sortedNumbers


// Objects and Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//Experiment - Add a constant property with let, and add another method that takes an argument.
extension Shape {
    //let solid = true
    func blah(a: Int) -> Int {
        return a * numberOfSides
    }
}


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// Every property needs a value assigned - either in its declaration (as with numberOfSides) or in the initialiser (as with name). Note the use of self to differentiate between the name property and the name argument.

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength:5.2, name:"My test square")
test.area()
test.simpleDescription()

// Experiment - Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.
class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}
let testCircle = Circle(radius:2.4, name:"my test circle")
testCircle.area()
testCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set (newPerimeter){
            sideLength = newPerimeter / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral tringle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength:3.1, name:"my test triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength


class TriangleAndSquare {
    var triangle:EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name:name)
    }
}
var triangleAndSquare = TriangleAndSquare(size:10, name:"another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength:50, name:"larger square")
triangleAndSquare.triangle.sideLength


// Optionals
// For methods, properties and subscripts you can write a ? afterwards and everything after the question mark will be ignored if the object is nil.
var optionalSquare: Square? = Square(sideLength: 2.5, name:"optional square")
var sideLength = optionalSquare?.sideLength
// let sideLength2 = optionalSquare.sideLength Doesn't work because optionalSquare has a type of Square? not Square. This is what the unwrapping is refering to.
optionalSquare = nil
sideLength = optionalSquare?.sideLength


// Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
ace.simpleDescription()
let two = Rank.two
two.simpleDescription()
two.rawValue

// Experiment - Write a function that compares two Rank values by comparing their raw values.
func compare(rank: Rank, toRank: Rank) -> Bool {
    return rank.rawValue == toRank.rawValue
}
compare(rank: ace, toRank: two)
compare(rank: ace, toRank: ace)

if let convertedRank = Rank(rawValue: 3) {
    let _ = convertedRank.simpleDescription()
}

// enums don't need to be backed by a raw value if they don't make sense. You can also use Int, Double or String as the raw backing type
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

extension Suit {
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
// hearts.toRaw() // This is an error because Suit doesnt have a raw backing type.
let heartsColor = hearts.color()


// Structures
// Structures are very similar to classes. They can both have methods and initialisers. One key difference is that structures are always copied when they are passed around in code. Classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

// Experiment - Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit
extension Card {
    func createFullDeck() -> [Card] {
        var deck: [Card] = []
        
        func appendFullRank(suit: Suit) {
            for rawRank in 1...13 {
                let card = Card(rank:Rank(rawValue:rawRank)!, suit:suit)
                deck.append(card)
            }
        }
        
        for suit in [Suit.hearts, Suit.diamonds, Suit.spades, Suit.clubs] {
            appendFullRank(suit: suit)
        }
        
        return deck
    }
}
let threeOfSpades = Card(rank: .three, suit:.spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

let aFullDeck = threeOfSpades.createFullDeck()
aFullDeck.map({ card in card.simpleDescription() })


// Enumerations
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00am", "8.09pm")
let failure = ServerResponse.Error("Out of cheese")

switch failure {
case let .Result(sunrise, sunset):
    let _ = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let _ = "Failure... \(error)"
}
// Experiment - Add a third case to ServerResponse and to the switch


// Protocols and Extensions
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription



// Experiment - Write an enumeration that conforms to this protocol
enum SimpleEnum: Int, ExampleProtocol {
    case A = 1, B, C, D, E
    
    var simpleDescription: String {
    get {
        return "A simple enum \(self.rawValue)"
    }
    }
    mutating func adjust() {
        self = SimpleEnum(rawValue:(self.rawValue + 1))!
    }
}
var c = SimpleEnum.A
c.adjust()
let cDescription = c.simpleDescription


// Extensions
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription
// The 7 above is a literal constant not a variable. Therefore you can't mutate it with adjust.

var someInt = 4
someInt.adjust()
someInt

// Experiment - Write an extension for the Double type that adds an absoluteValue property.
extension Double {
    var absoluteValue: Double {
        return self > 0 ? self : -self
    }
}

var aDouble = -7.0
aDouble.absoluteValue

4.absoluteValue
(-6.0).absoluteValue
let neg = -6.0
neg.absoluteValue
let absNeg = (-6.0.absoluteValue)


let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherProperty // Uncomment to see the error


// Error Handling
// You represent errors using any type that adopts the Error protocol
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    printerResponse
} catch {
    error
}

// Experiment
do {
    let printerResponse2 = try send(job: 1040, toPrinter: "Never Has Toner")
    printerResponse2
} catch {
    error
}

// You can provide multiple catch blocks to handle specific errors
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    printerResponse
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// Experiment


let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Defer
var fridgeIsOpen: Bool = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
fridgeIsOpen


// Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements <T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1,2,3], [3])
anyCommonElements([1,2,3], [6])
anyCommonElements([1,2,3], [3.0])

// Experiment - Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.
func returnAnyCommonElements <T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var commonElements: [T.Iterator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
    return commonElements
}
returnAnyCommonElements([1, 2, 3], [2, 3, 4])
//returnAnyCommon
