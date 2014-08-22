// Swift Operators - http://nshipster.com/swift-operators/

import Cocoa

// Overloading

func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    
    var result = left
    for _ in 1..<right {
        result += left
    }
    
    return result
}

"a" * 6

// overloading can be used for evil
[1, 2] + [3, 4]

func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](count: left.count, repeatedValue: 0.0)
    for (i, _) in enumerate(left) {
        sum[i] = left[i] + right[i]
    }
    
    return sum
}
println("\([1, 2] + [3, 4])")

func +(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int](count: left.count, repeatedValue: 0)
    for (i, _) in enumerate(left) {
        sum[i] = left[i] + right[i]
    }
    
    return sum
}

println("\([1, 2] + [3, 4])")


// I'm specifically concerned about the semantics of array operators, as demonstrated in the previous example. My 2 cents: arrays should forego the + and - operators in lieu of <<:

func <<<T> (inout left: [T], right: [T]) -> [T] {
    //left.extend(right)
    return left
}

func <<<T> (inout left: [T], right: T) -> [T] {
    //left.append(right)
    return left
}

//[1,2,3,4]<<[5,6]
//[1,2,3,4]<<5


// Custom Operators
infix operator ** { associativity left precedence 160 }
func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
}

2 ** 3 // 8

// When creating custom operators, make sure to also create the corresponding assignment operator, if appropriate:

infix operator **= { associativity right precedence 90 }
func **= (inout left: Double, right: Double) {
    left = left ** right
}


// Custom Operators with Protocol and Method
// First, a RegularExpressionMatchable protocol is declared, with a single method for matching regular expressions.
protocol RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions) -> Bool
}

// Next, an extension adding conformance to this protocol to String is declared, with a provided implementation of match, using NSRegularExpression.
extension String: RegularExpressionMatchable {
    func match(pattern: String, options: NSRegularExpressionOptions = nil) -> Bool {
        let regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)
        return regex.numberOfMatchesInString(self, options: nil, range: NSMakeRange(0, self.utf16Count)) != 0
    }
}

// Finally, the =~ operator is declared and implemented on a generic type conforming to RegularExpressionMatchable.
infix operator =~ { associativity left precedence 130 }
func =~<T: RegularExpressionMatchable> (left: T, right: String) -> Bool {
    return left.match(right, options: nil)
}

// By doing this, a user has the option to use the match function instead of the operator. It also has the added benefit of greater flexibility in what options are passed into the method.


// Use of Mathematical Symbols
prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
√16
√2

infix operator ± { associativity left precedence 140 }
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ± {}
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

2 ± 3
±4



// Guidelines for Swift Operators

// Don't create an operator unless its meaning is obvious and undisputed. Seek out any potential conflicts to ensure semantic consistency.
// Custom operators should only be provided as a convenience. Complex functionality should always be implemented in a function, preferably one specified as a generic using a custom protocol.
// Pay attention to the precedence and associativity of custom operators. Find the closest existing class of operators and use the appropriate precedence value.
// If it makes sense, be sure to implement assignment shorthand for a custom operator (e.g. += for +).
