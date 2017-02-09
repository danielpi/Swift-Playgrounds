// Playground - noun: a place where people can play

import Cocoa

enum MyBool {
    case myTrue, myFalse
}
var a: MyBool = MyBool.myTrue

extension MyBool {
    init() { self = .myFalse }
}
var b: MyBool = MyBool()

extension MyBool : BooleanLiteralConvertible {
    static func convertFromBooleanLiteral(value: Bool) -> MyBool {
        return value ? myTrue : myFalse
    }
}
var c: MyBool = true

extension MyBool : BooleanType {
    var boolValue: Bool {
        get {
            switch self {
            case .myTrue: return true
            case .myFalse: return false
            }
        }
    }
}
if a { println("a is true") }

extension MyBool {
    //MyBool can be constructed from BooleanType
    init(_ v : BooleanType) {
        if v.boolValue {
            self = .myTrue
        } else {
            self = .myFalse
        }
    }
}
var basicBool:Bool = false
a = MyBool(basicBool)
if a { println("a is true") } else { println("a is false") }

/*
//  Simple enums that have no associated data (like MyBool) are automatically made Equatable by the compiler, so no additional code is required.
extension MyBool : Equatable {
}
func ==(lhs: MyBool, rhs: MyBool) -> Bool {
    switch (lhs, rhs) {
    case (.myTrue, .myTrue), (.myFalse, .myFalse):
        return true
    default:
        return false
    }
}
*/
if a == a { println("a == a") }
if a != a { } else { println("!(a != a)") }

// Binary operations
func &(lhs:MyBool, rhs: MyBool) -> MyBool {
    if lhs {
        return rhs
    }
    return false
}
func |(lhs: MyBool, rhs: MyBool) -> MyBool {
    if lhs {
        return true
    }
    return rhs
}
func ^(lhs: MyBool, rhs: MyBool) -> MyBool {
    return MyBool(lhs != rhs)
}
a & b
b | c
c ^ a

prefix func !(a: MyBool) -> MyBool {
    return a ^ true
}
// Compound assignment (with bitwise and)
func &=(inout lhs: MyBool, rhs: MyBool) {
    lhs = lhs & rhs
}
!a
a &= b





