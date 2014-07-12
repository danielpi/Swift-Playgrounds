// Swift Standard Library - Types - String
// A String represents an ordered collection of characters.


// Creating a String
let emptyString = String()
let equivilentString = ""

let repeatedString = String(count: 5, repeatedValue: Character("a"))


// Querying a String
var string = "Hello, world!"
let firstCheck = string.isEmpty
string = ""
let secondCheck = string.isEmpty

string = "Hello, world!"
let hasPrefixFirstCheck = string.hasPrefix("Hello")
let hasPrefixSecondCheck = string.hasPrefix("hello")

let hasSuffixFirstCheck = string.hasSuffix("world!")
let hasSuffixSecondCheck = string.hasSuffix("World!")


// Changing and Converting Strings
let baseString = "Hello World"
let uppercaseString = baseString.uppercaseString

let lowercaseString = baseString.lowercaseString

string = "42"
if let number = string.toInt() {
    println("Got the number: \(number)")
} else {
    println("Couldn't convert to a number")
}


// Operators
// Concatinate +
let combination = "Hello " + "world"
// You can use the + operator with two strings as shown in the combination example, or with a string and a character in either order:
let exclamationPoint: Character = "!"
let charCombo = combination + exclamationPoint
let extremeCombo = exclamationPoint + charCombo

let first: Character = "a"
let second: Character = "b"
let result = first + second

// Append +=
string = "Hello "
string += "world"
string += exclamationPoint

// Equality ==
let string1 = "Hello world!"
let string2 = "Hello" + " " + "world" + "!"
let equality = string1 == string2

// Less than <
let stringGreater = "Number 3"
let stringLesser = "Number 2"
let resulNotLessThan = stringGreater < stringLesser
let resultIsLessThan = stringLesser < stringGreater



// What is missing from this chapter?
// - How does the less than operator work?
"abc" < "def"
"def" < "abc"
"Number 2" < "number 1"
// It just looks at the ordinal valu of the first character???

// - Does the greater than symbol work?
"abc" > "def"
"def" > "abc"
"Number 2" > "number 1"

// - How do you access the rodinal values of Characters?











