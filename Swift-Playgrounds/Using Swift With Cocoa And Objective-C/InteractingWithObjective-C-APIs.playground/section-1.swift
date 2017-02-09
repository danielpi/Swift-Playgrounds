//: # Interacting with Objective-C APIs
import UIKit
//import CoreGraphics
//import Foundation

//: ## Initialization

// UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)

let myTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))

// Objective-C Factory Methods
// UIColor *color = [UIColor colorWithRed: 0.5 green:0.0 blue:0.5 alpha:1.0]
let color = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)

//: ## Failable Initialization
if let image = UIImage(contentsOfFile: "MyImage.png") {
    print(image)
} else {
    print("UIImage initialization failed")
}


//: ## Accessing Properties
myTextField.textColor = UIColor.darkGray
myTextField.text = "Hello world"

//:  In Objective-C, a method that returns a value and takes no arguments can be treated as an implicit getter—and be called using the same syntax as a getter for a property. This is not the case in Swift. In Swift, only properties that are written using the @property syntax in Objective-C are imported as properties.


//: ## Working with Methods
//:  When Objective-C methods come over to Swift,
//: - the first part of an Objective-C selector becomes the base method name and appears outside the parentheses.
//: - The first argument appears immediately inside the parentheses, without a name.
//: - The rest of the selector pieces correspond to argument names and go inside the parentheses.
//: - All selector pieces are required at the call site.

let mySubview = UIView()
// [myTableView insertSubview:mySubview atIndex:2];
myTableView.insertSubview(mySubview, at: 2)
myTableView.layoutIfNeeded() // Parenthesis still required despite lack of arguments


//: ## id Compatibility
//:  AnyObject is a protocol type.
//:  The AnyObject protocol allows you to write type-safe Swift code while maintaining the flexibility of an untyped object. Because of the additional safety provided by the AnyObject protocol, Swift imports id as AnyObject.

var x: Any = "hello" as String
x as? String
x as? NSString

x = "goodbye" as NSString
x as? String
x as? NSString

// Downcasting Any
let userDefaults = UserDefaults.standard
let lastRefreshDate = userDefaults.object(forKey: "LastRefreshDate") // lastRefreshDate is of type Any?
if let date = lastRefreshDate as? Date {
    print("\(date.timeIntervalSinceReferenceDate)")
}

// If you are cetain of the type of the object, you can use the forced downcast operator

// let myDate = lastRefreshDate as! Date
// let timeInterval = myDate.timeIntervalSinceReferenceDate


// Dynamic Method Lookup
var myObject: AnyObject = UITableViewCell()
myObject = NSDate()
let futureDate = myObject.addingTimeInterval(10)
let timeSinceNow = myObject.timeIntervalSinceNow


// Unrecognized Selectors and Optional Chaining
// myObject.character(at: 5) // crash, myObject doesn't respond to that method

let myCount = myObject.count                // Int? type and nil value
let myChar = myObject.character?(at: 5)     // unichar? type and nil value
if let fifthCharacter = myObject.character?(at: 5) {
    print("Found \(fifthCharacter) at index 5")
}


//: ## Nullability and Optionals
//:  Swift makes all classes in argument types and return types optional in imported Objective-C APIs.
//:  Swift imports object types as implicitly unwrapped optionals.
var nulableProperty: Any?
var nonNullProperty: Any
var unannotatedProperty: Any!

func returnsNonNullValue() -> Any { return false }
func takesNonNullParameter(value: Any) {}

func returnsNullableValue() -> Any? { return nil }
func takesNullableParameter(value: Any?) {}

func returnsUnannotatedValue() -> Any! { return false }
func takesUnannotatedParameter(value: Any!) {}


// Extensions
extension UIBezierPath {
    convenience init(triangleSideLength: CGFloat, origin: CGPoint) {
        self.init()
        let squareRoot = CGFloat(sqrt(3.0))
        let altitude = (squareRoot * triangleSideLength) / 2
        move(to: origin)
        addLine(to: CGPoint(x: origin.x + triangleSideLength, y: origin.x))
        addLine(to: CGPoint(x: origin.x + triangleSideLength / 2, y: origin.y + altitude))
        close()
    }
}

//  You can use extensions to add properties (including class and static properties). However, these properties must be computed; extensions can’t add stored properties to classes, structures, or enumerations.
extension CGRect {
    var area: CGFloat {
        return width * height
    }
}
let rect = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 50.0)
let area = rect.area


// Closures
//  Objective-C blocks are automatically imported as Swift closures.

// void (^completionBlock)(NSData *, NSError *) = ^(NSData *data, NSError *error) { /* ... */ }
let completionBlock: (Data) -> Void = { data in
    /* ... */
}

// Avoiding String Reference Cycles When Capturing self
/*
self.closure = { [unowned self] in
    self.doSomething()
}
*/

// Object Comparison
//  Equality (==), compares the contents of the objects. 
//  Identity (===), determines whether or not the constants or variables refer to the same object instance.
//  Swift invokes the isEqual: method defined on the NSObject class. The NSObject class only performs an identity comparison, so you should implement your own isEqual: method in classes that derive from the NSObject class.
//

// Swift Type Compatibility
//  The @objc attribute makes your Swift API available in Objective-C and the Objective-C runtime.
/*
class Jukebox: NSObject {
    var library: Set<String>
    var nowPlaying: String?
    
    var isCurrentlyPlaying: Bool {
        return nowPlaying != nil
    }
    
    static var favoritesPlaylist: [String] {
        // return an array of song names
    }
    
    init(songs: String...) {
        self.library = Set<String>(songs)
    }
    
    func playSong(named name: String) throws {
        // play song or throw and error if unavailable
    }
}
*/

// Configuring Swift Interfaces in Objective-C
@objc(Color)
enum Цвет: Int {
    @objc(Red)
    case Красный
    
    @objc(Black)
    case Черный
}

@objc(Squirrel)
class Белка: NSObject {
    @objc(color)
    var цвет: Цвет = .Красный
    
    @objc(initWithName:)
    init(имя: String) {
        // ...
    }
    @objc(hideNuts:inTree:)
    func прячьОрехи(количество: Int, вДереве дерево: Цвет) { // Error
        // ...
    }
}


// Requiring Dynamic Dispatch
// Selectors
//  An Objective-C selector is a type that refers to the name of an Objective-C method. In Swift, Objective-C selectors are represented by the Selector structure.
//  In Swift string literals can be automatically converted to selectors
class MyViewController: UIViewController {
    let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let action = #selector(MyViewController.tappedButton)
        myButton.addTarget(self, action: action, for: .touchUpInside)
    }
    
    func tappedButton(sender: UIButton!) {
        print("tapped button")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


// Unsafe Invocation of Objective-C Methods
let string: NSString = "Hello, Cocoa!"
let selector = #selector(NSString.lowercased(with:))
let locale = Locale.current
if let result = string.perform(selector, with: locale) {
    print(result.takeUnretainedValue())
}

let array: NSArray = ["delta", "alpha", "zulu"]
let anotherSelector = #selector(getter: NSDictionary.allKeys)
// array.perform(selector) // Raises an exception because NSArray does not respond to this selector


// Keys and Key Paths
class Person: NSObject {
    var name: String
    var friends: [Person] = []
    var bestFriend: Person? = nil
    
    init(name: String) {
        self.name = name
    }
}

let gabrielle = Person(name: "Gabrielle")
let jim = Person(name: "Jim")
let yuanyuan = Person(name: "Yuanyuan")
gabrielle.friends = [jim, yuanyuan]
gabrielle.bestFriend = yuanyuan

#keyPath(Person.name)
gabrielle.value(forKey: #keyPath(Person.name))
#keyPath(Person.bestFriend.name)
gabrielle.value(forKeyPath: #keyPath(Person.bestFriend.name))
#keyPath(Person.friends.name)
gabrielle.value(forKeyPath: #keyPath(Person.friends.name))

let personNameKeyPath = #keyPath(Person.name)
yuanyuan.value(forKeyPath: personNameKeyPath)



