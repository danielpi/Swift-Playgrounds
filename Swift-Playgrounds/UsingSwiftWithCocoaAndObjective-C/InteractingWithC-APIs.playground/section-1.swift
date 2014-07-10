// Interacting with C APIs

import Foundation

// Primitive Types
//  Swift provides equivalents of C primitive integer types—for example, char, int, float, and double. 
//  However, there is no implicit conversion between these types and core Swift integer types, such as Int. Therefore, use these types if your code specifically requires them, but use Int wherever possible otherwise.
/*
    C Type              Swift Type
    bool                CBool
    char, signed char   CChar
    unsigned char       CUnsignedChar
    short               CShort
    unsigned short      CUnsignedShort
    int                 CInt
    unsigned int        CUnsignedInt
    long                CLong
    unsigned long       CUnsignedLong
    long long           CLongLong
    unsigned long long  CUnsignedLongLong
    wchar_t             CWideChar
    char16_t            CChar16
    char32_t            CChar32
    float               CFloat
    double              CDouble
*/

// Enumerations
//  Swift imports as a Swift enumeration any C-style enumeration marked with the NS_ENUM macro.
/*
Objective-C
typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
    UITableViewCellStyleDefault,
    UITableViewCellStyleValue1,
    UITableViewCellStyleValue2,
    UITableViewCellStyleSubtitle
}
*/
enum UITableViewCellStyle: Int {
    case Default
    case Value1
    case Value2
    case Subtitle
}
//  Swift also imports options marked with the NS_OPTIONS macro. Whereas options behave similarly to imported enumerations, options can also support some bitwise operations, such as &, |, and ~.


// Pointers
/* For Arguments
    C Syntax        Swift Syntax
------------------  -----------------------
    const void *    CConstVoidPointer
    void *          CMutableVoidPointer
    const Type *    CConstPointer<Type>
    Type *          CMutablePointer<Type>
*/
/* For return types, variables, and argument types more than one pointer level deep
    C Syntax        Swift Syntax
------------------  -----------------------
    void *          COpaquePointer
    Type *          UnsafePointer<Type>
*/
/* For Class Types
    C Syntax        Swift Syntax
------------------  -----------------------
    Type * const *  CConstPointer<Type>
    Type * __strong *   CMutablePointer<Type>
    Type **         AutoreleasingUnsafePointer<Type>
*/


// C Mutable Pointers
//  When a function is declared as taking a CMutablePointer<Type> argument, it can accept any of the following
//  - nil, which is passed as a null pointer
//  - A CMutablePointer<Type> value
//  - An in-out expression whose operand is a stored lvalue of type Type, which is passed as the address of the lvalue
//  - An in-out Type[] value, which is passed as a pointer to the start of the array, and lifetime-extended for the duration of the call
func takesAMutablePointer(x: UnsafePointer<Float>) {
    // Does something
}
var x: Float = 0.0
var p: UnsafePointer<Float> = nil
var a: [Float] = [1.0, 2.0, 3.0]
takesAMutablePointer(nil)
takesAMutablePointer(p)
takesAMutablePointer(&x)
takesAMutablePointer(&a)

/*
func takesAMutablePointer(x: UnsafePointer<Type>) {
    
}
var y: Int = 0
var p: UnsafePointer<Float> = nil
var q: UnsafePointer<Int> = nil

var b: [Int] = [1, 2, 3]

*/

// C Const Pointers
//  CConstPointer<Type> argument, it can accept any of the following:
//  - nil, which is passed as a null pointer
//  - A CMutablePointer<Type>, CMutableVoidPointer, CConstPointer<Type>, CConstVoidPointer, or AutoreleasingUnsafePointer<Type> value, which is converted to CConstPointer<Type> if necessary
//  - An in-out expression whose operand is an lvalue of type Type, which is passed as the address of the lvalue
//  - A Type[] value, which is passed as a pointer to the start of the array, and lifetime-extended for the duration of the call

func takesAConstPointer(x:ConstUnsafePointer<Float>) {
    
}
var q: ConstUnsafePointer<Float> = nil
takesAConstPointer(nil)
takesAConstPointer(q)
takesAConstPointer(&x)
takesAConstPointer([1.0, 2.0, 3.0])


// AutoreleasingUnsafePointer
//  AutoreleasingUnsafePointer<Type>, it can accept any of the following:
//  - nil, which is passed as a null pointer
//  - An AutoreleasingUnsafePointer<Type> value
//  - An in-out expression, whose operand is primitive-copied to a temporary nonowning buffer. The address of that buffer is passed to the callee, and on return, the value in the buffer is loaded, retained, and reassigned into the operand.
func takesAnAutoreleasingPointer(x: AutoreleasingUnsafePointer<NSDate?>) {
    /* ... */
}
var z: NSDate? = nil
var r: AutoreleasingUnsafePointer<NSDate?> = nil
takesAnAutoreleasingPointer(nil)
takesAnAutoreleasingPointer(r)
takesAnAutoreleasingPointer(&z)


// Global Constants
//  Global constants defined in C and Objective-C source files are automatically imported by the Swift compiler as Swift global constants.


// Preprocessor Directives
//  The Swift compiler does not include a preprocessor. Instead, it takes advantage of compile-time attributes, build configurations, and language features to accomplish the same functionality. For this reason, preprocessor directives are not imported in Swift.
// #define FADE_ANIMATION_DURATION 0.35
let FADE_ANIMATION_DURATION = 0.35
//  the compiler automatically imports simple macros defined in C and Objective-C source
// Complex Macros are not transferred across.


// Build Configurations
// Swift code can be conditionally compiled based on the evaluation of Build Configurations.
// Build configurations include the literals true and false, command line flags and the platform testing functions listed below.
// You can specify command line flags using -D <#flag#>.
/*
    Function        Valid Arguments
------------------  -----------------------
    os()            OSX, iOS
    arch()          x86_64, arm, arm64, i386
*/

/*
#if <#build configuration#> && !<#build configuration#>
    <#statements#>
#elseif <#build configuration#>
    <#statements#>
#else
    <#statements#>
#endif
*/
//  Conditional compilation statements in Swift must completely surround blocks of code that are self-contained and syntactically valid.







