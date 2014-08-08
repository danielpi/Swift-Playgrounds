# Swift Playgrounds

Some experiments with Playgrounds in XCode 6 using the Swift programming language.

##The Swift Programming Language Book

I have been working through all the examples in the book Apple Inc. “The Swift Programming Language.” iBooks. https://itunes.apple.com/au/book/swift-programming-language/id881256329?mt=11. Each .playground file in the project relates to a chapter from the Swift Programming Language book.

I have implemented this as a single XCode project that contains a playground file for each chapter of the language reference book. I'm finding it quite useful to have this project open when I am writing Swift code as I can use the project wide search functionality to lookup any Swift features or syntax that I am unsure about (so long as I can remember the words to look for)

Below is a list of each of the files within the project (this is also a list of the chapters of the book that I have worked through).

- **ASwiftTour.playground** contains the code from the "Swift Tour" chapter. This file has the most meat so far. It touches on most of the unusual features of the language and is easy to search through to find examples.

Chapters from the Language guide. Each chapter goes into depth about its particular subject.

- **TheBasics.playground** This chapter covers basic value types like Strings, Ints, Bools and floats. The notation for exponent values in float literals is interesting. Comments are covered (nested /* */ comment blocks). TypeAlias is covered as are tuples. Optionals are touched on and assertions are mentioned.
- **BasicOperators.playground** Arithmetic, remainder, increment, decrement, comparison, unary, ternary, range (closed and half-closed) and logical operators. There are examples of all of them.
- **StringsAndCharacters.playground** Some details about Unicode literals (multi-byte characters). The countElements() function for finding the length of a string. Concatenating strings, Comparing strings and Interpolating strings (not much on splitting or parsing strings). 
- **CollectionTypes.playground**
- **ControlFlow.playground**
- **Functions.playground**
- **Closures.playground**
- **Enumerations.playground**
- **ClassesAndStructures.playground**
- **Properties.playground**
- **Methods.playground**
- **Subscripts.playground**
- **Inheritance.playground**
- **Initialization.playgroung**
- **Deinitialization.playground**
- **AutomaticReferenceCounting.playground**
- **OptionalChaining.playground**
- **TypeCasting.playground**
- **NestedTypes.playground**
- **Extensions.playground**
- **Protocols.playground**
- **Generics.playground**
- **AdvancedOperators.playground**

That completes the Language Guide section of the book. I haven't decided if I will continue on with the Language reference section next or switch over to the "Using Swift with Cocoa and Objective-C" book. 

## Using Swift with Cocoa and Objective-C Book
There are six playground files that work through the code in the “Using Swift with Cocoa and Objective-C.” iBook. https://itunes.apple.com/au/book/using-swift-cocoa-objective/id888894773?mt=11. They are listed below. The example from this book didn't translate as well to the playgrounds as the previous book examples did. 

- **BasicSetup.playground**
- **InteractingWithObjective-C-APIs.playground**
- **WritingClassesWithObjectiveCBehaviour.playground**
- **WorkingWithCocoaDataTypes.playground**
- **AdoptingCocoaDesignPatterns.playground**
- **InteractingWithC-APIs.playground**


## Swift Standard Library
The documentation for the Swift Standard Library can be found at the following link https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/SwiftStandardLibraryReference/. There is a wealth of information contained in the standard library doc and it is nicely organised so that it is easy to experiment with in a playground environment. I have attempted to extend the examples somewhat to try and show off some of the other features of the standard library.

- **String.playground**
- **Array.playground**
- **Dictionary.playground**
- **NumericTypes.playground**
- **Protocols.playground**
- **FreeFunctions.playground**

## Swift Blog
The Swift blog contains several articles detailing interesting information about the developing language. 

- **2014-08-05 Boolean**
- **2014-07-28 Interacting with C Pointers
- **2014-07-23 Access Control**
