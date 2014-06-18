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
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Mostly Harmless")
default:
    println("Not a safe place for humans")
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
    println("UPC-A with value of \(numberSystem), \(identifier), \(check)")
case .QRCode(let productCode):
    println("QR code with value of \(productCode).")
}

productBarcode = Barcode.UPCA(8, 85909_51226, 3)
switch productBarcode {
case let .UPCA(numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check)")
case let .QRCode(productCode):
    println("QR code with value of \(productCode).")
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

let earthsOrder = PlanetRaw.Earth.toRaw()
let possiblePlanet = PlanetRaw.fromRaw(7)

let positionToFind = 9
if let somePlanet = PlanetRaw.fromRaw(positionToFind) {
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
} else {
    println("There isn't a planet at position \(positionToFind)")
}




