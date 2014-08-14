// Locking in Swift blog post by John Gallagher
// http://www.bignerdranch.com/blog/locking-in-swift-helping-protect-me-from-myself/

import Cocoa
import Foundation

// The Setup
// Writing a class that includes an array of things and a timestamp of when the array was last modified.
/*
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
a.appendToThings(5678)
a.appendToThings(4)
*/

// The Lock
// We want a readers-writer lock. Multiple readers can access the lock concurrently but only a single writer can have access at a time.
protocol ReadWriteLock {
    // Get a shared reader lock, run the given block, and unlock
    mutating func withReadLock(block: () -> ())
    
    // get an exclusive writer lock, run the given block, and unlock
    mutating func withWriteLock(block: () -> ())
}

struct MyLock: ReadWriteLock {
    var locked: Bool = false
    mutating func withReadLock(block: () -> ()) {
        if (!locked) {
            block()
        }
    }
    mutating func withWriteLock(block: () -> ()) {
        if (!locked) {
            block()
        }
    }
}

class ArrayTracker<T> {
    private var things: [T] = []
    private var lock: ReadWriteLock = MyLock()
    private var lastModified: NSDate?
    
    func lastModifiedDate() -> NSDate? {
        var date: NSDate?
        
        // withReadLock runs the block its given synchronously, so we don't need to capture self - use unowned
        lock.withReadLock { [unowned self] in
            date = self.lastModified
        }
        return date
    }
    
    func appendToThings(item: T) -> (NSDate, Int) {
        var date: NSDate!
        var count: Int!
        lock.withWriteLock { [unowned self] in
            self.things.append(item)
            self.lastModified = NSDate.date()
            date = self.lastModified
            count = self.things.count
        }
        return (date, count)
    }
}










