// Collection Types Chapter

let longForm: Array<Int> = [1,2,3,4]
let shortForm: [Int] = [5,6,7,8]

var shoppingList: [String] = ["Eggs","Milk"]

// Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

// Creating and Initializing and Array
var someInts = [Int]()
print("someInts is of type Int[] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles


// Dictionaries
let alongFormDict = Dictionary<String, Int>()
let shortFormDict = [String:Int]()

//var airports: Dictionary<String, String> = ["TYO":"Tokyo", "DUB":"Dublin"]
var airports: [String: String] = ["TYO":"Tokyo", "DUB":"Dublin"]

// Accessing and Modifying a Dictionary
print("The dictionary of airports contains \(airports.count) items.")
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// Iterating over a dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)

// Creating and Empty Dictionary
//var namesOfIntegers = Dictionary<Int, String>()
var namesOfIntegers = [Int:String]()
namesOfIntegers[16] = "Sixteen"
namesOfIntegers = [:]

// Mutability of Collections








