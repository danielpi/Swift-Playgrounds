// Interacting with Objective-C APIs
import UIKit
import CoreGraphics

// Initialization

// UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
let myTableView: UITableView = UITableView(frame: CGRectZero, style: .Grouped)

let myTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))

// Objective-C Factory Methods
// UIColor *color = [UIColor colorWithRed: 0.5 green:0.0 blue:0.5 alpha:1.0]
let color = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)


// Accessing Properties
myTextField.textColor = UIColor.darkGrayColor()
myTextField.text = "Hello world"
if myTextField.editing {
    //myTextField.editing = false
}

//  In Objective-C, a method that returns a value and takes no arguments can be treated as an implicit getter—and be called using the same syntax as a getter for a property. This is not the case in Swift. In Swift, only properties that are written using the @property syntax in Objective-C are imported as properties.


// Working with Methods
//  When Objective-C methods come over to Swift, 
// - the first part of an Objective-C selector becomes the base method name and appears outside the parentheses. 
// - The first argument appears immediately inside the parentheses, without a name. 
// - The rest of the selector pieces correspond to argument names and go inside the parentheses. 
// - All selector pieces are required at the call site.

let mySubview = UIView()
// [myTableView insertSubview:mySubview atIndex:2];
myTableView.insertSubview(mySubview, atIndex: 2)
myTableView.layoutIfNeeded() // Parenthesis still required despite lack of arguments


// id Compatibility
//  AnyObject is a protocol type.
//  The AnyObject protocol allows you to write type-safe Swift code while maintaining the flexibility of an untyped object. Because of the additional safety provided by the AnyObject protocol, Swift imports id as AnyObject.
var myObject: AnyObject = UITableViewCell()
myObject = NSDate()

//  You can also call any Objective-C method and access any property without casting to a more specific class type.
let futureDate = myObject.dateByAddingTimeInterval
let timeSinceNow = myObject.timeIntervalSinceNow

//  In contrast with Objective-C, if you invoke a method or access a property that does not exist on an AnyObject typed object, it is a runtime error. For example, the following code compiles without complaint and then causes an unrecognized selector error at runtime:
// myObject.characterAtIndex(5) // This causes a runtime error

//  When you call an Objective-C method on an AnyObject type object, the method call actually behaves like an implicitly unwrapped optional. You can use the same optional chaining syntax you would use for optional methods in protocols to optionally invoke a method on AnyObject.
//let myLength = myObject.length?
//let myChar = myObject.characterAtIndex?(5)
/*
if let fifthCharacter = myObject.characterAtIndex(5) {
    println("Found \(fifthCharacter) at index 5")
}
*/

let userDefaults = NSUserDefaults.standardUserDefaults()
let lastRefreshDate: AnyObject? = userDefaults.objectForKey("LastRefreshDate")
if let date = lastRefreshDate as? NSDate {
    println("\(date.timeIntervalSinceReferenceDate)")
}

let myDate = lastRefreshDate as NSDate
let timeInterval = myDate.timeIntervalSinceReferenceDate


// Working with nil
//  Swift makes all classes in argument types and return types optional in imported Objective-C APIs.
//  Swift imports object types as implicitly unwrapped optionals.


// Extensions
extension UIBezierPath {
    convenience init(triangleSideLength: Float, origin: CGPoint) {
        self.init()
        let squareRoot = Float(sqrt(3))
        let altitude = (squareRoot * triangleSideLength) / 2
        moveToPoint(origin)
        let point1 = CGPoint(triangleSideLength, origin.x)
        addLineToPoint(CGPoint(triangleSideLength, origin.x))
        addLineToPoint(CGPoint(triangleSideLength / 2, altitude))
        closePath()
    }
}


















