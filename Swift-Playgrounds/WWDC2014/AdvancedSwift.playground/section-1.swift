// WWDC 2014 - Advanced Swift


class Thing {
    init(_ location: Thing?, _ name: String, _ longDescription: String) {
        self.location = location
        self.name = name
        self.longDescription = longDescription
    }
    weak var location: Thing?
    var name: String
    var longDescription: String
}

let westOfHouse = Thing(nil, "house", "West of House")
let westWallOfHouse = Thing(westOfHouse, "wall", "The Plaster has crumbled away, leaving the wood beneath to rot.")
let pathWestOfHouse = Thing(westOfHouse, "path", "An overgrown path leads south around the corner of the house.")

protocol Pullable {
    func pull()
}

class Boards: Thing, Pullable {
    func pull() {
        if location === westWallOfHouse {
            println("They come off with little effort.")
            location = westOfHouse
        } else {
            println("Think of the splinters!")
        }
    }
}


let boards = Boards(westWallOfHouse, "boards", "They've been nailed directly to the wall.")

/*
func performPull(object: Thing) {
    if let pullableObject = object as Pullable {
        pullableObject.pull()
    } else {
        println("You aren't sure how to print a \(object.name).")
    }
}
*/

extension Thing: Printable {
    var description: String { return name }
}

extension Thing {
    var nameWithArticle: String {
        return "a " + name
    }
}

var object = Thing(westOfHouse, "wall", "The Plaster has crumbled away, leaving the wood beneath to rot.")

println("You aren't sure how to pull \(object)")
println("You aren't sure how to pull \(an ~ object)")

/*
// Special Protocols
// LogicValue                   if logicValue {
// Printable                    "\(printable)"
// Sequence                     for x in sequence
// IntegerLiteralConvertible    65536
// Float LIteralConvertible     1.0
// StringLiteralConvertible     "abc"
// ArrayLiteralConvertible      [ a, b, c ]
// DictionaryLiteralConvertible [ a: x, b: y ]

protocol Printable {
    var description: String { get }
}
*/






