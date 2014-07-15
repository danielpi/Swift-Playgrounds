// Swift Standard Library - Types - Dictionary

var emptyDictionary = Dictionary<String, Int>()
var equivilentEmptyDictionary = [String: Int]()
var anotherEmptyDictionary = Dictionary<String, Int>(minimumCapacity: 10)
var literalDictionary = ["a":1]


// Accessing and Changing Dictionary Elements
var dictionary = ["one": 1, "two": 2, "three": 3]
let value = dictionary["two"]
if let unwrappedValue = dictionary["three"] {
    println("The integer value for \"three\" was: \(unwrappedValue)")
    unwrappedValue
}

dictionary["three"] = 33
dictionary
// You can add to a dictionary using subscripting
dictionary["four"] = 4
dictionary
// you can remove a value for a key by setting it to nil
dictionary["three"] = nil
dictionary
// You can't change, add or remove elements to a constant dictionary

dictionary = ["one": 1, "two": 2, "three": 3]
let previousValue = dictionary.updateValue(22, forKey: "two")
dictionary
if let unwrappedPreviousValue = dictionary.updateValue(33, forKey: "three") {
    println("Replaced the previous value: \(unwrappedPreviousValue)")
} else {
    println("Added a new value")
}

dictionary = ["one": 1, "two": 2, "three": 3]
let prevValue = dictionary.removeValueForKey("two")
if let unwrappedPreviousValue = dictionary.removeValueForKey("three") {
    println("Removed the old value: \(unwrappedPreviousValue)")
} else {
    println("Didn't find a value for the given key to delete")
}

dictionary.removeAll()
dictionary


// Querying a Dictionary
dictionary = ["one": 1, "two": 2, "three": 3]
let elementCount = dictionary.count

for key in dictionary.keys {
    println("Key: \(key)")
}
let keysArray = Array(dictionary.keys)

for value in dictionary.values {
    println("Value: \(value)")
}
let valuesArray = Array(dictionary.values)


// Operators
let dictionary1 = ["one": 1, "two": 2]
var dictionary2 = ["one": 1]
dictionary2["two"] = 2
let result = dictionary1 == dictionary2

dictionary2 = ["one": 1]
let secondResult = dictionary1 != dictionary2








