// Access Control

//  You can assign specific access levels to individual types (classes, structures, and enumerations), as well as to properties, methods, initializers, and subscripts belonging to those types. Protocols can be restricted to a certain context, as can global constants, variables, and functions.


// Modules and Source Files
// A module is a single unit of code distribution - a framework or application. Something that can be imported


// Access Levels
// Public   - Available anywhere. Used for defining the public interface.
// Internal - Use within any source file within a module.
// Private  - Use only within the defining source file


// No entity can be defined in terms of another entity that has a lower (more restrictive) access level.


// Default Access level - Internal


// Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePriviateFunction() {}

public class AnotherPublicClass {           // explicitly public class
    public var somePublicProperty = 0       // explicitly public class member
    var someInternalProperty = 0            // implicitly internal class member
    private func somePrivateMethod() {}     // explicitly private class member
}

class AnotherInternalClass {                // implicitly internal class
    var someInternalProperty = 0            // implicitly internal class member
    private func somePrivateMethod() {}     // explicitly private class member
}

private class AnotherPrivateClass {         // explicitly private class
    var somePrivateProperty = 0             // implicitly private class member
    func somePrivateMethod() {}             // implicitly private class member
}


// Tuple Types
//  Tuples don't have a way to explicitly set their access level. Instead the tuples access level is set from the most restrictive access level of its components


// Function Types
//  The access level of a function is set as the most restrictive access level of the function arguments and return type. You also must explicitly set the access level of the function type if it doesn't match the default
/*
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}

The function above won't compile because the SomePrivateClass sets the function type to private which is not explicitly set.
*/
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), SomePrivateClass())
}


// Enumeration Types
// The individual cases of an enumeration have the same access level as the enum
private enum CompassPoint {
    case North
    case South
    case East
    case west
}



