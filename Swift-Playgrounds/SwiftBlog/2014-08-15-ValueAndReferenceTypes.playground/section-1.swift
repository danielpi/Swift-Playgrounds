// Value and Reference Types

import Foundation

// Value type example
struct S { var data: Int = -1 }
var a = S()
var b = a                       // a is copied to b
a.data = 42                     // Changes a, not b
println("\(a.data), \(b.data)")


// Reference type example
class C { var data: Int = -1 }
var x = C()
var y = x                       // x is copied to y
x.data = 42                     // changes the instance referred to by x (and y)
println("\(x.data), \(y.data)")


// Use a value type when:
// - Comparing instance data with == makes sense
// - You want copies to have independent state
// - The data will be used in code across multiple threads

// Use a reference type when:
// - Comparing instance identity with === makes sense
// - You want to create shared, mutable state




