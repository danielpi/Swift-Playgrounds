// Locking in Swift blog post by John Gallagher
// http://www.bignerdranch.com/blog/locking-in-swift-helping-protect-me-from-myself/

import Cocoa
import Foundation

// The Setup
// Writing a class that includes an array of things and a timestamp of when the array was last modified.

class ArrayTracker<T> {
    private var things: [T] = []
    private var lastModified: NSDate? // Why is this optional?
    
    func appendToThings(item: T) -> (NSDate, Int) {
        things.append(item)
        lastModified = NSDate.date()
        return (lastModified!, things.count)
    }
    
    func lastModifiedDate() -> NSDate? {
        return lastModified
    }
}

var a: ArrayTracker = ArrayTracker<Int>()

let (l1, c1) = a.appendToThings(1234)
l1
c1



