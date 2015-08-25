import Cocoa

//: # Error Handling
//: Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime (NOTE: recoverable).
//:
//: ## Representing and Throwing Errors
enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(required: Int)
    case OutOfStock
}

// throw VendingMachineError.InsufficientFunds(required: 5)

//: ## Handling Errors
//: ### Propagating Errors using Throwing Functions
func canThrowErrors() throws -> String { return "" }
func cannotThrowErrors() -> String { return "" }

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(required: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }

}


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
//: Note that vend() must be marked with the try keyword. Also because the errors are not handled here the error is propagated up to buyFavoriteSnack() as noted by the throws keyword.


//: ## Handling Errors Using Do-Catch
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
    // Enjoy delicious snack
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock")
} catch VendingMachineError.InsufficientFunds(let amountRequired) {
    print("Insufficient funds. Please insert an additional $\(amountRequired).")
}

//: ## Converting Errors to Optional Values
//: If an error is thrown while evaluating the try? expression, the value of the expression is nil
enum Error: ErrorType { case Unlucky }
func someThrowingFunction() throws -> Int {
    let success = arc4random_uniform(5)
    if success == 0 { throw Error.Unlucky }
    return Int(success)
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//: Try? lets you write concise error handling code when you want to handle all errors the same way.

struct Data { }
func fetchDataFromDisk() throws -> Data {
    let success = arc4random_uniform(5)
    if success == 0 { throw Error.Unlucky }
    return Data()
}
func fetchDataFromServer() throws -> Data {
    let success = arc4random_uniform(5)
    if success == 0 { throw Error.Unlucky }
    return Data()
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
fetchData()


//: ## Disabling Error Propagation
//: Calling a throwing function or method with try! disables error propagation and wraps the call in a run-time assertion that no error will be thrown. If an error actually is thrown, you'll get a runtime error.

//let photo = try! loadImage("./Resources/John Appleseed.jpg")


//: ## Specifying Clean-Up Actions
//: A defer statement defers execution until the current scope is exited.
//: Deferred statements may not contain any code that would transfer control out of the statements, such as a break or return statement, or by throwing an error.
//: Deferred actions are executed in reverse order of how they are specified.

enum FileError: ErrorType {
    case endOfFile
    case fileClosed
}

func exists(filename: String) -> Bool { return true }
class FakeFile {
    var isOpen = false
    var filename = ""
    var lines = 100
    func readline() throws -> String? {
        if self.isOpen {
            if lines > 0 {
                lines -= 1
                return "line number \(lines) of text\n"
            } else {
                throw FileError.endOfFile
                //return nil
            }
        } else {
            throw FileError.fileClosed
        }
    }
}

func open(filename: String) -> FakeFile {
    let file = FakeFile()
    file.filename = filename
    file.isOpen = true
    print("\(file.filename) has been opened")
    return file
}

func close(file: FakeFile) {
    file.isOpen = false
    print("\(file.filename) has been closed")
}

func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file
            print(line)
        }
        // close(file) is called here, at the end of the scope.
    }
}

do {
    try processFile("myFakeFile")
} catch FileError.endOfFile {
    print("Reached the end of the file")
} catch FileError.fileClosed {
    print("The file isn't open")
}






