// Functions Chapter

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
println(sayHello("Anna"))
println(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
    return "Hello, " + personName + "!"
}
println(sayHelloAgain("Anna"))


// Function Parameters and Return Values
// Multiple Input Parameters
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))

// Functions Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
println(sayHelloWorld())

// Functions Without Return Values
func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return countElements(stringToPrint)
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello, world")
printWithoutCounting("hello, world")

// Functions with Multiple Return Values
func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0 , others = 0
    for character in string {
        switch String(character).lowercaseString {
            case "a", "e", "i", "o", "u":
                ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
            default:
                ++others
        }
    }
    return (vowels, consonants, others)
}
let total = count("some arbitrary string!")
println("\(total.vowels) vowels and \(total.consonants) consonants")

// Function Parameter Names
