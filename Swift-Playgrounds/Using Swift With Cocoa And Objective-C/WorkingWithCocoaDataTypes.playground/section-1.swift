// Working with Cocoa Frameworks
//  Data types that are convertible or can be used interchangeably are referred to as bridged data types.

import UIKit

// Strings
// Swift automatically bridges between the String type and the NSString class.

// To enable string bridging, just import Foundation.
import Foundation
let string: String = "abc"
let bridgedString: NSString = string as NSString

let stringLiteral: NSString = "123"
if let integerValue = Int(stringLiteral as String) {
    print("\(stringLiteral) is the integer \(integerValue)")
}


// Numbers
// Swift automatically bridges from Int, UInt, Float, Double, Bool to NSNumber
let number = 42
let bridgedNumber: NSNumber = number as NSNumber

let integerLiteral: NSNumber = 5
let floatLiteral: NSNumber = 3.14159
let booleanLiteral: NSNumber = true


// Arrays
//  Swift automatically bridges from NSArray to the native Array structure. The bridged class will be of type AnyObject[]. You can downcast the AnyObject[] to a more specific type. This will return an optional type though as it is not possible to know that all of the elements of the array can be downcast to the specified type until runtime.

let schoolSupplies: NSArray = ["Pencil", "Eraser", "Notebook"]

// Sets
let amenities: NSSet = ["Sauna", "Steam Room", "Jacuzzi"]

// Dictionaries
let medalRankings: NSDictionary = ["Gold": "1st Place", "Silver": "2nd Place", "Bronze": "3rd Place"]


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


// Unified Logging
// The unified logging system provides an API for capturing messaging across all levels of the system, and is a replacement for the NSLog function in the Foundation framework.

/*
import os.log
os_log("This is a log message.")

let fileSize = 1234567890
os_log("Finished downloading file. Size: %{iec-bytes}d", fileSize)

os_log("This is additional info that may be helpful for troubleshooting.", type: .info)

let customLog = OSLog(subsystem: "com.your_company.your_subsystem_name.plist", category: "your_category_name")
os_log("This is info that may be helpful during development or debugging.", log: customLog, type: .debug)
*/





