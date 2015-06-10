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

enum PlanetRaw: Int {
    case Mercury = 1, Venuc, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = PlanetRaw.Earth.rawValue
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




