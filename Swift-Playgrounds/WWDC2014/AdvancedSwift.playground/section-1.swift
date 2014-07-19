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
let wallWestOfHouse = Thing(westOfHouse, "wall", "The Plaster has crumbled away, leaving the wood beneath to rot.")
let pathWestOfHouse = Thing(westOfHouse, "path", "An overgrown path leads south around the corner of the house.")

class Boards: Thing {
    
}


let boards = Boards(wallWestOfHouse, "boards", "They've been nailed directly to the wall.")
