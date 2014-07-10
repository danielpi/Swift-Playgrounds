// Adopting Cocoa Design Patterns

import Cocoa

// Delegation
/*
if let fullScreenSize = myDelegate?.window?(myWindow, willUseFullScreenContentSize: mySize) {
    println(NSStringFromSize(fullScreenSize))
}
*/
// 1. Check that myDelegate is not nil.
// 2. Check that myDelegate implements the method window:willUseFullScreenContentSize:.
// 3. If 1 and 2 hold true, invoke the method and assign the result of the method to the value named fullScreenSize.
// 4. Print the return value of the method.
//  In a pure Swift app, type the delegate property as an optional NSWindowDelegate object and assign it an initial value of nil.


// Error Reporting
//  Error reporting in Swift follows the same pattern it does in Objective-C.
//  In the simplest case, you return a Bool value from the function to indicate whether or not it succeeded. 
//  When you need to report the reason for the error, you can add to the function an NSError out parameter of type NSErrorPointer. This type is roughly equivalent to Objective-C’s NSError **. You can use the prefix & operator to pass in a reference to an optional NSError type as an NSErrorPointer object, as shown in the code listing below.
/*
var writeError: NSError?
let written = myString.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: &writeError)
if !written {
    if let error = writeError {
        println("write failure: \(error.localizedDescription)")
    }
}
*/

func contentsForType(typeName: String!, error: NSErrorPointer) -> AnyObject! {
    let errorOccured = true
    //if cannotProduceContentsForType(typeName) {
    if errorOccured {
        if error {
            error.memory = NSError(domain: NSPOSIXErrorDomain, code: 1, userInfo: [:])
        }
        return nil
    }
}

var errorPointer: NSErrorPointer = NSErrorPointer()
let typeName = "JPEG"
contentsForType(typeName, errorPointer)


// Target-Action
// Basically the same as in Objective-C


// Introspection
// In  ObjC you use isKindOfClass: and conformsToProtocol:
// In Swift you use the is operator and the as? operator to downcast
/*if errorPointer is NSButton {
    println("\(typeName) is a string")
} else {
    println("typeName is not a string")
}

if let button = errorPointer as? NSErrorPointer {
    
}
*/
//  Checking for and casting to a protocol follows exactly the same syntax as checking for and casting to a class.
/*
if let dataSource = object as? UITableViewDataSource {
    // object conforms to UITableViewDataSource and is bound to dataSource
} else {
    // object not conform to UITableViewDataSource
}
*/






