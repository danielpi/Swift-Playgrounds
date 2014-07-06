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

