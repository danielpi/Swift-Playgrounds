// Classes and Structures

class SomeClasse {
    
}

struct SomeStruct {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types
//  All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances.
let vga = Resolution(width: 640, height: 480)


// Structures and Enumerations are Value Types
//  A value type is a type that is copied when it is assigned to a variable or constant, or when it is passed to a function.
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case noth, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}


// Classes are Reference Types
//  Reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
//  Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):

// Pointers
// A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but is not a direct pointer to an address in memory.


// Choosing Between Classes and Structures
// Assignment and Copy Behaviour for Dictionaries
