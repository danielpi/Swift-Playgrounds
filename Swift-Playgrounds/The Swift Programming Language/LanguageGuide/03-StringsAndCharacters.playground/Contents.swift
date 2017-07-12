// Strings and Characters

let someString = "Some tring literal value"

let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the king said gravely, "and go on
till you come to the end; then stop."
"""

let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""

let singleLineString = "These are the same."
let mutilineString = """
These are the same.
"""

"""

This string starts with a line feed.
It also ends with a line feed.

"""

func generateQuotation() -> String {
    let quotation = """
        The White Rabbit put on his spectacles. "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the king said gravely, "and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(quotation == generateQuotation())


// Initializing an Empty Strings
var emptyString = ""
var anotherEmpyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}


// String mutability
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" // There can be only one


// Working with Characters
for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
catString


// Concatenating Strings and Characters
let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
// Welcome now equals "hellow there"

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)


// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Special Characters in String LIterals
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"           // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"         // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"    // 💖, Unicode scalar U+1F496


// Extended Grapheme Clusters
let eAcute: Character = "\u{E9}"                // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                 // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"  // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸

let regionalIndicatorForAUS: Character = "\u{1F1E6}\u{1F1FA}"
// regionalIndicatorForAUS is 🇦🇺


// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// prints "unusualMenagerie has 40 characters"

// Note that Swift's use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string's character count.

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// prints "the number of characters in cafe is 4"

word += "\u{301}" // Combining Acute accent, U+301

print("the number of characters in \(word) is \(word.characters.count)")
// prints "the number of characters in café is 4"


// Accessing and Modifying a String
// String Indices
// Different characters can require different amounts of memory to store, so in order to determine which Character is at a particular position, you must iterate over each Unicode scalar from the start or end of that String. For this reaason, Swift strings cannot be indexed by integer values.

let greeting = "Guten Tag!"
greeting[greeting.startIndex]                               // G
greeting[greeting.index(before: greeting.endIndex)]         // !
greeting[greeting.index(after: greeting.startIndex)]        // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]                                             // a
// greeting[greeting.endIndex]                              // error
// greeting.endIndex.successor()                            // error

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// prints "G u t e n  T a g !"


// Inserting and Removing
// To insert a character at a specified index.
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)

// To insert another string at a specified index
welcome2.insert(contentsOf:" there".characters, at: welcome2.index(before: welcome2.endIndex))

// To remove a character at a specified index
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
welcome2

// To remove a substring
let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)


// Comparing Strings
let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}
// Two String values are considered equal if their extended grapheme clusters are canonically equivalent (if they have the same linguistic meaning and appearance, even if the are composed from different Unicode scalars).

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
let combinedEAcuteQuestion2 = "Voulez-vous un cafe\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// Conversely, characters that are visually similar but do not have the same linguistic meaning are not considered equal.
let latinCapitalLeterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLeterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}


// Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


// Unicode Representations of Strings
let dogString = "Dog!!🐶"

// UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

// UTF-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
