// Swift Standard Library - Protocols

// Equatable
// The Equatable protocol makes it possible to determine whether two values of the same type are considered to be equal.
struct MyEquatableStruct: Equatable {
    var name = "Untitled"
}
func == (lhs: MyEquatableStruct, rhs: MyEquatableStruct) -> Bool {
    return lhs.name == rhs.name
}

let value1 = MyEquatableStruct()
var value2 = MyEquatableStruct()
let firstCheck = value1 == value2
value2.name = "A New Name"
let secondCheck = value1 == value2


// Comparable
// The Comparable protocol makes it possible to compare two values of the same type
// There is one required operator overload defined in the protocol (<) as well as one defined in the inherited Equatable protocol (==). You get >, <= and >= for free.
struct MyComparableStruct: Comparable {
    var name = "Untitled"
}
func == (lhs: MyComparableStruct, rhs: MyComparableStruct) -> Bool {
    return lhs.name == rhs.name
}
func < (lhs: MyComparableStruct, rhs: MyComparableStruct) -> Bool {
    return lhs.name < rhs.name
}

let value3 = MyComparableStruct()
var value4 = MyComparableStruct()
let thirdCheck = value3 < value4
value4.name = "A New Name"
let fourthCheck = value4 < value3
let fifthCheck = value4 > value3
let sixthCheck = value4 <= value3
let seventhCheck = value4 >= value3


// Printable
// The Printable protocol allows you to customize the textual representation of any type ready for printing (for example, to Standard Out).
struct MyPrintableStruct: Printable {
    var name = "Untitled"
    var description: String {
    return "MyType: \(name)"
    }
}

let value = MyPrintableStruct()
println("Created a \(value)") // Not working in Beta-3


// Sequence Protocol
// https://medium.com/swift-programming/sequence-beyond-primitive-iterations-in-swift-80bc2507d8cc
class TodoItem {
    var name:String
    var priority:Int
    
    init(name:String, priority:Int) {
        self.name = name
        self.priority = priority
    }
}

struct GenericGenerator<T>: Generator {
    var items:[T]
    mutating func next() -> T? {
        return items.isEmpty ? .None : items.removeAtIndex(0)
    }
}

class TodoItemRepository : Sequence {
    var items:[TodoItem] = [];
    func addItem(item:TodoItem) {
        items += item
    }
    func generate() -> GenericGenerator<TodoItem> {
        return GenericGenerator(items: items)
    }
}

var repo = TodoItemRepository()
repo.addItem(TodoItem(name: "One", priority: 5))
repo.addItem(TodoItem(name: "Two", priority: 2))
repo.addItem(TodoItem(name: "Three", priority: 6))
repo.addItem(TodoItem(name: "Four", priority: 0))

repo.items.count
for item in repo {
    println("\(item.name) has a priority of \(item.priority)")
}
repo.items.count



