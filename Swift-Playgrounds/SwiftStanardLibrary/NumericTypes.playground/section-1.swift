// Swift Standard Library - Types - Numeric Types

// Boolean
var aBool: Bool
aBool = true
aBool = false
!aBool
aBool.description
aBool.getLogicValue()
aBool.getMirror()
aBool.hashValue


// Int
// The primary integer type in Swift is Int, which is word-sized. This means that it holds 32 bits on 32-bit platforms, and 64 bits on 64-bit platforms.
// For the majority of use cases, you should use the base Int type.
var anInt = Int()
anInt.advancedBy(3)
anInt.advancedBy(5) // I don't understand this one
anInt
anInt = -10
anInt.asUnsigned()
anInt.distanceTo(20)
anInt.encode()
anInt.getArrayBoundValue()
anInt.getMirror()
anInt.predecessor()
anInt.successor()

// Int is 64 bit on my Mac OS X system
Int.min
Int.max

UInt.min
let maxUInt = UInt.max
println("Max UInt = \(maxUInt)")

Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max

UInt8.min
UInt8.max
UInt16.min
UInt16.max
UInt32.min
UInt32.max
UInt64.min
UInt64.max


// Floating Point
// The primary floating-point type in Swift is Double, which uses 64 bits. If you do not require 64-bit precision, Swift also includes a 32-bit Float type.
var aDouble = Double()
aDouble.advancedBy(5)
aDouble.description
aDouble.isFinite
aDouble.isInfinite
aDouble.isNaN
aDouble.isNormal
aDouble.isSignaling
aDouble.isSignMinus
aDouble.isSubnormal
aDouble.isZero

aDouble = 1.0 / 0.0
aDouble.isInfinite
aDouble.isNaN

aDouble = Double.NaN
aDouble.isNaN

aDouble = Double.abs(-7.3)


















