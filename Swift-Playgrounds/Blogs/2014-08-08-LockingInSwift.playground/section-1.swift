// Locking in Swift blog post by John Gallagher
// http://www.bignerdranch.com/blog/locking-in-swift-helping-protect-me-from-myself/

import Cocoa
import Foundation
import dispatch


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

/*
// The Lock
// We want a readers-writer lock. Multiple readers can access the lock concurrently but only a single writer can have access at a time.
protocol ReadWriteLock {
    // Get a shared reader lock, run the given block, and unlock
    mutating func withReadLock(block: () -> ())
    
    // get an exclusive writer lock, run the given block, and unlock
    mutating func withWriteLock(block: () -> ())
}

struct MyLock: ReadWriteLock {
    let queue = dispatch_queue_create("readWriteLock", dispatch.DISPATCH_QUEUE_CONCURRENT)
    mutating func withReadLock(block: () -> ()) {
        dispatch_async(queue, block)
    }
    mutating func withWriteLock(block: () -> ()) {
        dispatch_barrier_async(queue, block)
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
*/


protocol ReadWriteLock {
    // Get a shared reader lock, run the given block, unlock, and return whatever the block returned
    mutating func withReadLock<T>(block: () -> T) -> T
    
    // Get an exclusive writer lock, run the given block, unlock, and return whatever the block returned
    mutating func withWriteLock<T>(block: () -> T) -> T
}

struct MyLock: ReadWriteLock {
    let queue = dispatch_queue_create("readWriteLock", dispatch.DISPATCH_QUEUE_CONCURRENT)
    mutating func withReadLock<T>(block: () -> T) -> T {
        var result: T
        dispatch_sync(queue) {
            result = block()
        }
        return result
    }
    mutating func withWriteLock<T>(block: () -> T) -> T {
        var result: T
        dispatch_barrier_sync(queue) {
            result = block()
        }
        return result
    }
}

class ArrayTracker<T> {
    private var things: [T] = []
    private var lock: ReadWriteLock = MyLock()
    private var lastModified: NSDate?
    
    func lastModifiedDate() -> NSDate? {
        // return the result of the call to withReadLock...
        return lock.withReadLock { [unowned self] in
            // ... which is the date that we want
            return self.lastModified
        }
    }
    
    func appendToThings(item: T) -> (NSDate, Int) {
        return lock.withWriteLock { [unowned self] in
            self.things.append(item)
            self.lastModified = NSDate.date()
            return (self.lastModified!, self.things.count)
        }
    }
}








