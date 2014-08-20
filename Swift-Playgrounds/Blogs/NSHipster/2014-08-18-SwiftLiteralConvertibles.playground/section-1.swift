// Swift Literal Convertibles from NSHipster http://nshipster.com/swift-literal-convertible/

import Foundation

/*
enum Optional<T> : Reflectable, NilLiteralConvertible {
    case None
    case Some(T)
    init()
    init(_ some: T)
    var hasValue: Bool { get }
    
    func map<U>(f: (T) -> U) -> U?
    func getMirror() -> MirrorType
    static func convertFromNilLiteral() -> T?
}
*/ // Doesn't seem to work

struct Regex {
    let pattern: String
    let options: NSRegularExpressionOptions!
    
    private var matcher: NSRegularExpression {
        return NSRegularExpression(pattern: self.pattern, options: self.options, error: nil)
    }
    
    init(pattern: String, options: NSRegularExpressionOptions = nil) {
        self.pattern = pattern
        self.options = options
    }
    
    func match(string: String, options: NSMatchingOptions = nil) -> Bool {
        return self.matcher.numberOfMatchesInString(string, options: options, range: NSMakeRange(0, string.utf16Count)) != 0
    }
}

extension Regex: StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    static func convertFromExtendedGraphemeClusterLiteral(value: ExtendedGraphemeClusterLiteralType) -> Regex {
        return self(pattern: value)
    }
    
    static func convertFromStringLiteral(value: StringLiteralType) -> Regex {
        return self(pattern: value)
    }
}

let string: String = "foo bar baz"
let regex: Regex = "foo"
regex.match(string)

"foo".match(string)



// ArrayLiteralConvertible and Sets
struct Set<T: Hashable> {
    typealias Index = T
    private var dictionary: [T: Bool]
    
    init() {
        self.dictionary = [T: Bool]()
    }
    
    var count: Int {
        return self.dictionary.count
    }
    
    var isEmpty: Bool {
        return self.dictionary.isEmpty
    }
    
    func contains(element: T) -> Bool {
        return self.dictionary[element] ?? false
    }
    
    mutating func put(element: T) {
        self.dictionary[element] = true
    }
    
    mutating func remove(element: T) -> Bool {
        if self.contains(element) {
            self.dictionary.removeValueForKey(element)
            return true
        } else {
            return false
        }
    }
}

var basicSet: Set<Int> = Set()
basicSet.put(1)
basicSet.put(2)
basicSet.put(3)
basicSet.contains(1)
basicSet.count

extension Set: ArrayLiteralConvertible {
    static func convertFromArrayLiteral(elements: T...) -> Set<T> {
        var set = Set<T>()
        for element in elements {
            set.put(element)
        }
        return set
    }
}

let set: Set = [1, 2, 3]
set.contains(1)
set.count



// StringLitralConvertible and URLs
extension NSURL: StringLiteralConvertible {
    public class func convertFromExtendedGraphemeClusterLiteral(value: String) -> Self {
        return self(string: value)
    }
    
    public class func convertFromStringLiteral(value: String) -> Self {
        return self(string: value)
    }
}

"http://nshipster.com/".host



