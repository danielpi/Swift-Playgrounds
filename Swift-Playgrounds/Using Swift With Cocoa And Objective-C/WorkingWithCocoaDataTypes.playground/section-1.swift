// Working with Cocoa Data Types
//  Data types that are convertible or can be used interchangeably are referred to as bridged data types.

import UIKit

// Strings
// Swift automatically bridges between the String type and the NSString class.

// To enable string bridging, just import Foundation.
import Foundation
let greeting = "hello, world!"
let capitalizedGreeting = greeting.capitalizedString

let myString: NSString = "123"
if let integerValue = Int(myString as String) {
    print("\(myString) is the integer \(integerValue)")
    integerValue
}


// Localization
//  NSLocalizedString, NSLocalizedStringFromTable, NSLocalizedStringFromTableInBundle, and NSLocalizedStringWithDefaultValue. In Swift you can use a single function that provides the same functionality as the entire set of NSLocalizedString macros—NSLocalizedString(key:tableName:bundle:value:comment:).


// Numbers
// Swift automatically bridges from Int, UInt, Float, Double, Bool to NSNumber
let n = 42
let m: NSNumber = n
// You can pass an Int to an argument expecting an NSNumber. You can't pass an NSNumber to an argument expecting an Int though as NSnumber can represent a wide variety of number formats


// Collection classes
// Arrays
//  Swift automatically bridges from NSArray to the native Array structure. The bridged class will be of type AnyObject[]. You can downcast the AnyObject[] to a more specific type. This will return an optional type though as it is not possible to know that all of the elements of the array can be downcast to the specified type until runtime.
let foundationArray: NSArray = NSArray(array: [1,2,3])
let swiftArray = foundationArray as [AnyObject]
if let downcastedSwiftArray = swiftArray as? [UIView] {
    for object in downcastedSwiftArray {
        print("\(object)")
    }
}


//for aView: UIView! in foundation Array as [UIView] {
//for aView in foundationArray as! [UIView] {
    // aView is of type UIView
    // Though I thought this would cause an error as foundation array objects are not UIViews
//}

let schoolSupplies: NSArray = ["Pencil", "Eraser", "Notebook"]


// Foundation Data Types
let size = CGSize(width: 20, height: 40)
let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
let width = rect.width
let maxX = rect.maxY


// Foundation Functions
NSLog("%.7f", 3.1415922222)


// Core Foundation
//  Core Foundation types are automatically imported as full-fledged Swift classes. Wherever memory management annotations have been provided, Swift automatically manages the memory of Core Foundation objects, including Core Foundation objects that you instantiate yourself.

// Remapped Types
//  When Swift imports Core Foundation types, the compiler remaps the names of these types. The compiler removes Ref from the end of each type name because all Swift classes are reference types, therefore the suffix is redundant.
//  The Core Foundation CFTypeRef type completely remaps to the AnyObject type. Wherever you would use CFTypeRef, you should now use AnyObject in your code.

// Memory Managed Objects
//  Core Foundation objects returned from annotated APIs are automatically memory managed in Swift—you do not need to invoke the CFRetain, CFRelease, or CFAutorelease functions yourself.

// Unmanaged Objects
//  When Swift imports APIs that have not been annotated, the compiler cannot automatically memory manage the returned Core Foundation objects. Swift wraps these returned Core Foundation objects in an Unmanaged<T> structure. All indirectly returned Core Foundation objects are unmanaged as well. For example, here’s an unannotated C function:
/*
Objective-C
CFStringRef StringByAddingTwoStrings(CFStringRef string1, CFStringRef string2)

Swift
func StringByAddingTwoStrings(CFString!, CFString!) -> Unmanaged<CFString>!
*/
//  When you receive an unmanaged object from an unannotated API, you should immediately convert it to a memory managed object before you work with it. Use takeUnretainedValue() or takeRetainedValue()
/*
let memoryManagedResult = StringByAddingTwoStrings(str1, str2).takeUnretainedValue()
*/




