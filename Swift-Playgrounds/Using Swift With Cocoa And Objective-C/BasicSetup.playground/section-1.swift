// Basic Setup

//  Swift is designed to provide seamless compatibility with Cocoa and Objective-C.

/* This guide covers three important aspects of the compatability of Objective-C and Swift
        - Interoperability, lets you interface between Swift and Objective-C code.
        - Mix and Match, allows you to create mixed language apps
        - Migration, from objective-C code to Swift
*/


// Understanding the Swift Import Process
//  Any Objective-C framework (or C library) that’s accessible as a module can be imported directly into Swift.

import Foundation

// The import Process
// - Objective-C framworks vend APIs in header files.
// - In Swift those header files rae compiled down to Objective-C modules
