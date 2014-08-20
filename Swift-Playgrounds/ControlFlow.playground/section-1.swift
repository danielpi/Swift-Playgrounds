// Control Flow Chapter

for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    println("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}

for character in "Hello" {
    println(character)
}

for var index = 0; index < 3; ++index {
    println("index = \(index)")
}

var index: Int
for index = 0; index < 3; ++index {
    println("index is \(index)")
}
println("The loop statements were executed \(index) times")


let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
println("Game over!")

square = 0
diceRoll = 0
do {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
println("Game over!")

// If
var temperatureInFarenheit = 30
if temperatureInFarenheit <= 32 {
    println("It's very cold. Consider wearing a scarf")
}

temperatureInFarenheit = 40
if temperatureInFarenheit <= 32 {
    println("It's very cold. Consider wearing a scarf")
} else {
    println("It's not that cold. wear a t-shirt.")
}

temperatureInFarenheit = 90
if temperatureInFarenheit <= 32 {
    println("It's very cold. Consider wearing a scarf")
} else if temperatureInFarenheit >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. wear a t-shirt.")
}

temperatureInFarenheit = 72
if temperatureInFarenheit <= 32 {
    println("It's very cold. Consider wearing a scarf")
} else if temperatureInFarenheit >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
}


// Switch
let someCharacter: Character = "e"
switch someCharacter {
    case "a", "e", "i", "o", "u":
        println("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        println("\(someCharacter) is a consonant")
    default:
        println("\(someCharacter) is not a vowel or consonant")
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
    //case "a": // Not valid if this line is in place as no executble line for this case statement.
    case "A":
        println("The letter A")
    default:
        println("Not the letter A")
}


// Range Matching
let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}
println("There are \(naturalCount) \(countedThings).")


// Tuples
let somePoint = (1,1)
switch somePoint {
case (0, 0):
    println("(0,0) is at the origin")
case (_, 0):
    println("\(somePoint.0),0) is on the x-axis")
case (0, _):
    println("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    println("(\(somePoint.0, somePoint.1)) is inside the box")
default:
    println("(\(somePoint.0, somePoint.1)) is outside of the box")
}


// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with a y value of \(y)")
case let (x, y):
    println("somewhare else at (\(x), \(y))")
}


// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    println("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    println("(\(x), \(y)) is just some arbitrary point")
}

// Control Transfer Statements
// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
        case "a", "e", "i", "o", "u", " ":
            continue
    default:
        puzzleOutput.append(character)
    }
}
puzzleOutput

// Break
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3”
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break

}
if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    println("An integer value could not be found for \(numberSymbol).")
}

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
println(description)


// Labelled Statements
square = 0
diceRoll = 0
board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

gameLoop: while square != finalSquare {
    if ++diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
println("Game over!")





