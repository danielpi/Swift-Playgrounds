// Closures Chapter from From: Apple Inc. “The Swift Programming Language.” iBooks. https://itun.es/au/jEUH0.l

//  Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

// Closure Expressions
// The Sort Function
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

// Closure Expression Syntax
reversed = names.sort({ (s1:String, s2: String) -> Bool in return s1 > s2 })

// Inferring Type from from Context
reversed = names.sort({ s1, s2 in return s1 > s2 })

// Implicit returns from Single-Expression Closures
reversed = names.sort({ s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversed = names.sort({ $0 > $1 })

// Operator Functions
reversed = names.sort(>)


// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> ()) {
    
}
someFunctionThatTakesAClosure({})
someFunctionThatTakesAClosure() {
    
}

reversed = names.sort { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four",
    5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
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

//: ## Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let nextCustomer = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)

print("Now serving \(nextCustomer())!")
print(customersInLine.count)

//: Even though the first element of the customersInLine array is removed as part of the closure, that operation isn't carried out until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated. Note that the type of nextCustomer is not String but () -> String - a function that takes no arguments and returns a string.

func serveNextCustomer(customer: () -> String) {
    print("Now serving \(customer())!")
}
serveNextCustomer( { customersInLine.removeAtIndex(0) } )

//: The serveNextCustomer function above takes an explicit closure that returns the next customer's name. The version below performs the same operation but, instead uses an autoclosure. Now you can call the function as if it took a String argument instead of a closure.

func serveNextCustomer2(@autoclosure customer: () -> String) {
    print("Now serving \(customer())!")
}

serveNextCustomer2(customersInLine.removeAtIndex(0))

//: ### @autoclosure(escaping)

var customerClosures: [() -> String] = []
func collectCustomerClosures(@autoclosure(escaping) customer: () -> String) {
    customerClosures.append(customer)
}
collectCustomerClosures(customersInLine.removeAtIndex(0))
collectCustomerClosures(customersInLine.removeAtIndex(0))

print("Collected \(customerClosures.count) closures.")
for customerClosure in customerClosures {
    print("Now serving \(customerClosure())!")
}











