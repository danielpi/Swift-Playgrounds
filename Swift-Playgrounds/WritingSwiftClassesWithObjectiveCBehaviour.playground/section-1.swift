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
    @IBO
}

