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




