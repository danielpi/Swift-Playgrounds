// Enumerations

//  An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West

directionToHead = .East


// Matching Enumeration Values with a Switch Statement
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly Harmless")
default:
    print("Not a safe place for humans")
}

// Associated Values
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let identifier, let check):
    print("UPC-A with value of \(numberSystem), \(identifier), \(check)")
case .QRCode(let productCode):
    print("QR code with value of \(productCode).")
}

productBarcode = Barcode.UPCA(8, 85909_51226, 3)
switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    print("UPC-A with value of \(numberSystem), \(identifier), \(check)")
case let .QRCode(productCode):
    print("QR code with value of \(productCode).")
}


// Raw Values
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum PlanetRaw: Int {
    case Mercury = 1, Venuc, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = PlanetRaw.Earth.rawValue
// earthsOrder is 3

enum CompassPointRaw: String {
    case North, South, East, West
}
let sunsetDirection = CompassPointRaw.West.rawValue
// sunsetDirection is "West"


// Initializing from a Raw Value
let possiblePlanet = PlanetRaw(rawValue: 7)

let positionToFind = 9
if let somePlanet = PlanetRaw(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


// Recursive Enumerations
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    case Number(Int)
    case Addition(ArithmeticExpression2, ArithmeticExpression2)
    case Multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case let .Addition(lhs, rhs):
        return evaluate(lhs) + evaluate(rhs)
    case let .Multiplication(lhs, rhs):
        return evaluate(lhs) * evaluate(rhs)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))


