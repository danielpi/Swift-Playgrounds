// Closures Chapter from From: Apple Inc. “The Swift Programming Language.” iBooks. https://itun.es/au/jEUH0.l

//  Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

// Closure Expressions
// The Sort Function
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = sorted(names, backwards)

// Closure Expression Syntax
reversed = sorted(names, { (s1:String, s2: String) -> Bool in return s1 > s2 })

// Inferring Type from from Context
reversed = sorted(names, { s1, s2 in return s1 > s2 })

// Implicit returns from Single-Expression Closures
reversed = sorted(names, { s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversed = sorted(names, { $0 > $1 })

// Operator Functions
reversed = sorted(names, >)


// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> ()) {
    
}
someFunctionThatTakesAClosure({})
someFunctionThatTakesAClosure() {
    
}

reversed = sorted(names) { $0 > $1 }

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four", 5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
strings


// Capturing Values
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementByTen()

// Closures are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()









