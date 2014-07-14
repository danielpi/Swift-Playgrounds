// Swift Standard Library - Types - Array
// An Array is a generic type that manages an ordered collection of items, all of which must be of the same underlying type.

// Creating and Array
var emptyArray = Array<Int>()
var equivilentEmptyArray = [Int]()

let numericArray = Array(count: 3, repeatedValue: 42)
let stringArray = Array(count: 2, repeatedValue: "Hello")


// Accessing Array Elements
var subscriptableArray = ["zero", "one", "two", "three"]
let zero = subscriptableArray[0]
let three = subscriptableArray[3]

subscriptableArray[0] = "nothing"
subscriptableArray[3] = "three items"
subscriptableArray

// It is not possible to insert additional items into the array using subscripting:
// subscriptableArray[4] = "new item"
// Fatal erro: Array Index out of range
// Instead use append() or +=

// You also can't modify the contents of an array that was initialised using let
let constantArray = ["zero", "one", "two", "three"]
//constantArray[0] = "nothing"

subscriptableArray = ["zero", "one", "two", "three"]
let subRange = subscriptableArray[1...3]

subscriptableArray[1...2] = ["oneone", "twotwo"]
subscriptableArray

subscriptableArray[1...2] = []
subscriptableArray

// It is not possible to insert additional items into the array using subscripting
//subscriptableArray[4...5] = ["four", "five"]


// Adding and Removing Elements
var array = [0, 1]
array.append(2)
array
array.append(3)
array
// You can only append to an array that has been initialised with the var keyword.
//constantArray.append("another")

array = [1, 2, 3]
array.insert(0, atIndex: 0)
array
// The index must be less than or equal to the number of items in the collection
//array.insert(6, atIndex: 6)
// You can't insert into an array that was initialised with let

let removed = array.removeAtIndex(0)
array
// The index must be valid
// You can't remove from an array that was created with let

let lastRemoved = array.removeLast()
array
// There must be at least one element in the array
// You can't removeLast() from a constant array

array = [0, 1, 2, 3]
array.removeAll()
let count = array.count
array
// Unless you specify otherwise, the underlying backing storage will be cleared
array = [0, 1, 2, 3]
array.removeAll(keepCapacity: true)
array

array.reserveCapacity(10)
// Ensures that the underlying storage can hold the given total number of elements


// Querying an array
var arrayToCount = ["zero", "one", "two"]
let firstCount = arrayToCount.count
arrayToCount += "three"
let secondCount = arrayToCount.count

let firstIsEmpty = arrayToCount.isEmpty
arrayToCount.removeAll()
let secondIsEmpty = arrayToCount.isEmpty

var capacity = arrayToCount.capacity
arrayToCount.reserveCapacity(1000)
capacity = arrayToCount.capacity


// Algorithms
// Sort
// The closure that you supply for isOrderedBefore should return a Boolean value to indicate whether one element should be before (true) or after (false) another element:
var arrayToSort = [3, 2, 5, 1, 4]
arrayToSort.sort { $0 < $1 }
arrayToSort
arrayToSort.sort { $1 < $0 }
arrayToSort
// You can only sort an array inplace if it was declared with var

arrayToSort = [3, 2, 5, 1, 4]
let sortedArray = arrayToSort.sorted { $0 < $1 }
sortedArray
let descendingArray = arrayToSort.sorted { $1 < $0 }
descendingArray

sortedArray
let reversedArray = sortedArray.reverse()
reversedArray

let filteredArray = sortedArray.filter { $0 % 2 == 0 }
filteredArray

let multipliedArray = sortedArray.map { $0 * 2 }
multipliedArray

let describedArray = sortedArray.map { "Number: \($0)" }
describedArray

let addResult = sortedArray.reduce(0) { $0 + $1 }
addResult
let multipliedResult = sortedArray.reduce(0) { $0 * $1 }
multipliedResult


// Operators
var operatorArray = [0, 1, 2]
operatorArray += 3
operatorArray += [4, 5, 6]
// The type of elements must match
// You can only add new elements to an array that has been declared with var























