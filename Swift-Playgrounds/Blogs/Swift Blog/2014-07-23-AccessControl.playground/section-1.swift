// Playground - noun: a place where people can play

import Cocoa
import Foundation

public class ListItem {
    
    // Public properties.
    public var text: String
    public var isComplete: Bool
    
    // Readable throughout the module, but only writable from within this file.
    private(set) var UUID: NSUUID
    
    public init(text: String, completed: Bool, UUID: NSUUID) {
        self.text = text
        self.isComplete = completed
        self.UUID = UUID
    }
    
    // Usable within the framework target, but not by other targets.
    func refreshIdentity() {
        self.UUID = NSUUID()
    }
    
    public func isEqual(object: AnyObject?) -> Bool {
        if let item = object as? ListItem {
            return self.UUID == item.UUID
        }
        return false
    }
}

let item1 = ListItem(text: "Item 1", completed: false, UUID: NSUUID())
