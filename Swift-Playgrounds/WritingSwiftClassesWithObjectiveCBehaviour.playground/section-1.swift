// Writing Swift Classes with Objective-C Behaviour

//  You can 
//   - subclass Objective-C classes, 
//   - adopt Objective-C protocols, 
//   - take advantage of other Objective-C functionality 
//  when writing a Swift class.


// Inheriting from Objecive-C Classes
import UIKit

class MySwiftViewController: UIViewController {
    
}


// Adopting Protocols
/*
class AnotherSwiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
}
*/


// Interacting with Interface Builder
// Working with Oulets and Actions
//
//  When you declare an outlet in Swift, 
//  - the compiler automatically converts the type to a weak implicitly unwrapped optional
//  - assigns it an initial value of nil

//  The compiler replaces @IBOutlet var name: Type with @IBOutlet weak var name: Type! = nil. 
//  The compiler converts the type to an implicitly unwrapped optional so that you aren’t required to assign a value in an initializer. It is implicitly unwrapped because after your class is initialized from a storyboard or xib file, you can assume that the outlet has been connected. Outlets are weak by default because the outlets you create usually have weak relationships.
class YetAnotherSwiftViewController: UIViewController {
    @IBOutlet var button: UIButton!
    //@IBOutlet var textFields: [UITextField]
    @IBAction func buttonTapped(AnyObject) {
        println("button tapped!")
    }
}


// Live Rendering
//  @IBDesignable, allows for live rendering of a custom view in IB
//  When you create a custom view that inherits from UIView or NSView, you can add the @IBDesignable attribute just before the class declaration. After you add the custom view to Interface Builder (by setting the custom class of the view in the inspector pane), Interface Builder renders your view in the canvas.
//  @IBInspectable, allows you to change property values of your custom classes from IB
//  You can also add the @IBInspectable attribute to properties with types compatible with user defined runtime attributes. After you add your custom view to Interface Builder, you can edit these properties in the inspector.
@IBDesignable
class DesignableCustomView: UIView {
    @IBInspectable var textColor: UIColor = UIColor(hue: 0.0, saturation: 0.9, brightness: 0.8, alpha: 1.0)
    @IBInspectable var iconHeight: CGFloat = 0.0
}


// Specifying Property Attributes
// Swift properties are strong by default. Use the weak keyword if required. Weak properties must be optional class types.
// There are no readwrite and readonly attributes in swift. Use let for read only and var for read/write properties.
// In Swift, the Objective-C copy property attribute translates to @NSCopying.


// Implementing Core Data Managed Object Subclasses
// “Add the @NSManaged attribute before each property definition in your managed object subclass that corresponds to an attribute or relationship in your Core Data model. Like the @dynamic attribute in Objective-C, the @NSManaged attribute informs the Swift compiler that the storage and implementation of a property will be provided at runtime.






var textColor: UIColor = UIColor(hue: 0.0, saturation: 0.9, brightness: 0.8, alpha: 1.0)
var textColorArray: [UIColor] = []
for i in 0..<10 {
    let sat = 0.1 * Float(i)
    var textColor: UIColor = UIColor(hue: CGFloat(sat), saturation: 0.7, brightness: 0.5, alpha: 0.9)
    textColorArray.append(textColor)
}
textColorArray

