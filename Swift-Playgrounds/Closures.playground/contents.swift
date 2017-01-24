// Closures Chapter from From: Apple Inc. “The Swift Programming Language.” iBooks. https://itun.es/au/jEUH0.l

//  Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

// Closure Expressions
// The Sort Function
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// Closure Expression Syntax
reversedNames = names.sorted(by: { (s1:String, s2: String) -> Bool in return s1 > s2 })

// Inferring Type from from Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// Implicit returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

// Operator Functions
reversedNames = names.sorted(by: >)


// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> ()) {
    
}
someFunctionThatTakesAClosure(closure: {})
someFunctionThatTakesAClosure() {
    
}

reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four",
    5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings


// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

// Closures are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Escaping Closures
var completionHandlers: [() -> Void] = []
func soneFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        soneFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) // Prints "200"

//: ## Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

//: Even though the first element of the customersInLine array is removed as part of the closure, that operation isn't carried out until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated. Note that the type of nextCustomer is not String but () -> String - a function that takes no arguments and returns a string.

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0) )

//: The serveNextCustomer function above takes an explicit closure that returns the next customer's name. The version below performs the same operation but, instead uses an autoclosure. Now you can call the function as if it took a String argument instead of a closure.


//: ### @autoclosure(escaping)

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}











