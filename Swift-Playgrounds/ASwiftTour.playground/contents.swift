// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground!"


// Simple Values
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

// Values are never implicitly converted to another type.
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//let widthLabel = label + width // Could not find an overload for + that accepts the provided arguments

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples + oranges) pieces of fruit"

let π: Float = 3.14
let name = "Peter Pie"
let piePy = "\(name) likes the number \(π)"

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
var emptyDictionary = Dictionary<String, Float>()

shoppingList = []
emptyDictionary = [:]

// Control Flow
let individualScores = [75,43,103,87,12]
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
optionalString = nil

var optionalName: String? = "John Appleseed"
//optionalName = nil
var greeting = "Hello"
if let name = optionalName {
    greeting += ", \(name)"
} else {
    greeting
}


// Switches
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
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
var firstForLoop = 0
for i in 0..<3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop


// Functions and Closures
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", day: "Tuesday")

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// A variable number of arguments can be accepted by a function. They are collected into an array for use within the function.
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

func meanOf(numbers: Int...) -> Double {
    var sum = 0
    for number in numbers {
        sum += number
    }
    let mean = Double(sum) / Double(numbers.count)
    return mean
}
meanOf(42, 597, 12)
// This is a bit poor. The variable number of arguments being converted into an array means that you can't pass them onto another function. In meanOf above I was unable to reuse sumOf because numbers was an array and sumOf can't accept an array input

// Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//  Functions are a first-class type. This means that a function can return another function as its value.
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
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
var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)

// Closures
// Use the keyword "in" to seperate the parameters from the body
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({
    (number:Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
})

// Single statement closures implicitly return the value of their only statement
numbers.map({ number in 3 * number})

// A closure passed as the last argument to a function can appear immediately after the parentheses
let sortedNumbers = numbers.sort { $0 > $1 }
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
var triangle = EquilateralTriangle(sideLength:3.3, name:"my test triangle")
triangle.perimeter
triangle.perimeter = 1.0
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

// You can specify a second parameter name within a method on a class so that the parameter can be refered to by different names when used within the method or outside the method
class Counter {
    var count: Int = 0
    func incrementBy(amount:Int, numberOfTimes times:Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes:7)

// Optionals
// For methods, properties and subscripts you can write a ? afterwards and everything after the question mark will be ignored if the object is nil.
var optionalSquare: Square? = Square(sideLength: 2.5, name:"optional square")
var sideLength = optionalSquare?.sideLength
// let sideLength2 = optionalSquare.sideLength Doesn't work because optionalSquare has a type of Square? not Square. This is what the unwrapping is refering to.
optionalSquare = nil
sideLength = optionalSquare?.sideLength


// Enumerations and Structures
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Fice, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
ace.simpleDescription()
let two = Rank.Two
two.simpleDescription()
two.rawValue

func compare(rank: Rank, toRank: Rank) -> Bool {
    return rank.rawValue == toRank.rawValue
}
compare(ace, toRank: two)
compare(ace, toRank: ace)

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// enums don't need to be backed by a raw value if they don't make sense. You can also use Int, Double or String as the raw backing type
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
// hearts.toRaw() // This is an error because Suit doesnt have a raw backing type.
let heartsColor = hearts.color()


// Structures
// Structures are very similar to classes. They can both have methods and initialisers. One key difference is that structures are always copied when they are passed around in code. Classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    
    func createFullDeck() -> [Card] {
        var deck: [Card] = []
        
        func appendFullRank(suit: Suit) {
            for rawRank in 1...13 {
                let card = Card(rank:Rank(rawValue:rawRank)!, suit:suit)
                deck.append(card)
            }
        }
        
        for suit in [Suit.Hearts, Suit.Diamonds, Suit.Spades, Suit.Clubs] {
            appendFullRank(suit)
        }
        
        return deck
    }
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit:.Spades)
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
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}


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

extension Double {
    var absoluteValue: Double {
        return self > 0 ? self : -self
    }
}

var aDouble = -7.0
aDouble.absoluteValue

4.absoluteValue
-6.0.absoluteValue // Not sure why this doesn't work
let neg = -6.0
neg.absoluteValue
let absNeg = (-6.0.absoluteValue)

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherProperty // Uncomment to see the error


// Generics
func `repeat`<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for _ in 0..<times {
        result.append(item)
    }
    return result
}
`repeat`("knock", times: 4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1,2,3], rhs: [3])
anyCommonElements([1,2,3], rhs: [6])
anyCommonElements([1,2,3], rhs: [3.0])


func returnAnyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> [T.Generator.Element] {
    var commonElements: [T.Generator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
    return commonElements
}
returnAnyCommonElements([1,2,3], rhs: [3])
returnAnyCommon