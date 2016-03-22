// Methods Chapter

// Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

// amount is a local name only.
// numberOfTimes is both a local and external name
class CounterTwo {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}
let counter2 = CounterTwo()
counter2.incrementBy(5, numberOfTimes:3)
//  You don’t need to define an external parameter name for the first argument value, because its purpose is clear from the function name incrementBy. The second argument, however, is qualified by an external parameter name to make its purpose clear when the method is called.


// The self Property
//  Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use this implicit self property to refer to the current instance within its own instance methods.
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}


// Modifying Value TYpes from Within
// Instance Methods
//  if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method.
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(2.0, y:3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")

let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
// this will report an error because fixedPoint is a constant

// Assigning to self Within a Mutating Method
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

//  Mutating methods for enumerations can set the implicit self parameter to be a different member from the same enumeration:
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()


// Type Methods
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}



