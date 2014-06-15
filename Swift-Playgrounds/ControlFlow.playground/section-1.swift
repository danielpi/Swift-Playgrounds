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
var board = Int[](count: finalSquare + 1, repeatedValue: 0)
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















