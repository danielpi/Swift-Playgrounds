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
    case Noth, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
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


// Assignment and Copy Behaviour for Dictionaries
var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages

copiedAges["Peter"] = 24
print(ages["Peter"])

/*
// Assignment and Copy Behaviour for Arrays
var a = [1, 2, 3]
var b = a
var c = a
println(a[0])
println(b[0])
println(c[0])
//  If you set an item in the array to a new value with subscript syntax, all three of a, b, and c will return the new value.
a[0] = 42
println(a[0])
println(b[0])
println(c[0])
//  However, if you append a new item to a, you do modify the array’s length. This prompts Swift to create a new copy of the array at the point that you append the new value. Henceforth, a is a separate, independent copy of the array.
a.append(4)
a[0] = 777
println(a[0])
println(b[0])
println(c[0])

// Ensuring that an Array is Unique
b.unshare()
b[0] = -105
println(a[0])
println(b[0])
println(c[0])

// Checking whether Two Arrays Share the same Elements
if b === c {
    println("b and c still share the same array elements.")
} else {
    println("b and c now refer to two independent sets of array elements.")
}

if b[0...1] === b [0...1] {
    println("These two subarrays share the same elements.")
} else {
    println("These two subarrays do not share the same elements.")
}

// Forcing a Copy of an Array
var names = ["Mohsen", "Hilary", "Justyn", "Amy", "Rich", "Graham", "Vic"]
var copiedNames = names.copy()
copiedNames[0] = "Mo"
println(names[0])
*/











