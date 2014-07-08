// Strings and Characters

let someString = "Some tring literal value"

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\x24"
let blackHeart = "\u2665"
let sparklingHeart = "\U0001F496"
// let blah = "\u{123456}" // This doesn't seem to work yet


// Empty Strings
var emptyString = ""
var anotherEmpyString = String()
if emptyString.isEmpty {
    println("Nothing to see here")
}

// String mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" // There can be only one

// Working with Characters
for character in "Dog!🐶" {
    println(character)
}

let yenSign: Character = "¥"
println(yenSign)

// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")
// Note that countElements iterates over the full string because Unicode characters may take multiple bytes.

// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
let character1: Character = "!"
let character2: Character = "?"
let stringPlusCharacter = string1 + character1
let stringPlusString = string1 + string2
let characterPlusString = character1 + string1
let characterPlusCharacter = character1 + character2

var instruction = "look over"
instruction += string2

var welcome = "good morning"
welcome += character1

// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Comparing Strings
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    println("These two strings are considered equal")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        ++act1SceneCount
    }
}
println("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
let whispered = normal.lowercaseString

// Unicode
let dogString = "Dog!🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
print("\n")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value)")
}
print("\n")

for scalar in dogString.unicodeScalars {
    println("\(scalar)")
}



