// Advanced Operators

//  Unlike arithmetic operators in C, arithmetic operators in Swift do not overflow by default. Overflow behavior is trapped and reported as an error. To opt in to overflow behavior, use Swift’s second set of arithmetic operators that overflow by default, such as the overflow addition operator (&+). All of these overflow operators begin with an ampersand (&).

// Bitwise Operators
// Bitwise NOT
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

// Bitwise AND
let firstSixBits: UInt8 = 0b11111100
let lastSixBits:  UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

// Bitwise OR
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits

// Bitwise XOR
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

// Bitwise Left and Right Shift
let shiftBits: UInt8 = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF

let negativeBits: Int8 = -4
negativeBits << 1
negativeBits << 2
negativeBits << 5
negativeBits << 6
negativeBits >> 2
negativeBits >> 5 // Doesn't overflow


// Overflow Operators
//  Overflow addition (&+)
//  Overflow subtraction (&-)
//  Overflow multiplication (&*)

var potentialOverflow = Int16.max
// potentialOverflow += 1 // This causes an error if it runs

var willOverflow = UInt8.max
willOverflow = willOverflow &+ 1

// Value Underflow
var unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &+ 1

unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1


// Precedence and Associativity
//  Operator associativity defines how operators of the same precedence are grouped together (or associated)—either grouped from the left, or grouped from the right. Think of it as meaning “they associate with the expression to their left,” or “they associate with the expression to their right.
2 + 3 * 4 % 5

// * and % have a higher precedence than +. 
// * and & have the same precendence as each other but both associate to their left. Think of this as adding implicit parentheses around these parts of the expression, starting from their left: (This explanation seems arbitrary to me. Aparently more info in the Expressions chapter)


// Operator Functions
// Infix Operators
struct Vector2D {
    var x = 0.0, y = 0.0
}
extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y:4.0)
let combinedVector = vector + anotherVector

// Prefix and Postfix Operators
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative


// Compound Assignment Operators
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

//  It is not possible to overload the default assignment operator (=). Only the compound assignment operators can be overloaded. Similarly, the ternary conditional operator (a ? b : c) cannot be overloaded.


// Equivalence Operators
//  Custom classes and structures do not receive a default implementation of the equivalence operators, known as the “equal to” operator (==) and “not equal to” operator (!=).
extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivilent.")
}


// Custom Operators
//  Custom operators can be defined only with the characters / = - + * % < > ! & | ^ . ~

// +++ prefix doubling incrementer
prefix operator +++
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled


// Precedence and Associativity for Custom Infix Operators
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector











