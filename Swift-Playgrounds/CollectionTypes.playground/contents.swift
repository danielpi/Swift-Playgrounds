// Collection Types

// Arrays
// Creating an Empty Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

// Creating an Array with a Default Value
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an Array with an Array Literal
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


// Iterating Over an Array
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}



// Sets
// Hash Values for Set Types
// A type must be hashable in order to be stored in a set.

// Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []
// letters is now an empty set, but is still of type Set<Character>

// Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
let alsoFavoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// Accessing and Modifying a Set
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print("\(genre)")
}

for genre in favoriteGenres.sort({ $0[$0.endIndex.predecessor()] > $1[$1.endIndex.predecessor()] }) {
    print("\(genre)")
}

for genre in favoriteGenres.sort().reverse() {
    print("\(genre)")
}

// Performing Set Operations
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

// Set Membership and Equality
// Set a is a superset of set b, because a contains all elements of b
// Set b is a subset of a
// Set b and set c are disjoint with one another as they share no elements in common

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)



// Dictionaries
let alongFormDict = Dictionary<String, Int>()
let shortFormDict = [String:Int]()

// Creating an Empty Dictionary
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// Creating a Dictionary with a Dictionary Literal
//var airports: Dictionary<String, String> = ["TYO":"Tokyo", "DUB":"Dublin"]
var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

// Accessing and Modifying a Dictionary
print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

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

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)










