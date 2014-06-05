// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


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
let emptyArray = String[]()
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



