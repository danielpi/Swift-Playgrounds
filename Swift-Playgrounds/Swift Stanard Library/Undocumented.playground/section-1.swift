// http://practicalswift.com/2014/06/14/the-swift-standard-library-list-of-built-in-functions/

import Cocoa


abs(-1)
abs(42)

var languages = ["Swift", "Objective-C"]
contains(languages, "Swift")
contains(languages, "Java")
contains([29, 85, 42, 96, 75], 42)

var oldLanguagees = dropFirst(languages)
languages

languages = ["Swift", "Objective-C"]
var newLanguages = dropLast(languages)
languages

languages = ["Swift", "Objective-C"]
dump(languages)

equal(languages, ["Swift", "Objective-C"])

for i in filter(1...100, { $0 % 10 == 0 }) {
    println(i)
}

find(languages, "Swift")

indices([29, 85, 42])

join(":", ["A", "B", "C"])

map(1...3, { $0 * 5 })
for i in map(1...10, { $0 * 10 }) {
    println(i)
    assert(contains([10, 20, 30, 40, 50, 60, 70, 80, 90, 100],i))
}

max(1, 3, 8, 2)

maxElement(1...10)
maxElement(languages)

minElement(1...10)
minElement(languages)

let reducedLanguages = reduce(languages, "", { $0 + $1 })
reducedLanguages
let reducedArray = reduce([10, 20, 5], 1, { $0 * $1 })
reducedArray

reverse([1,2,3])

startsWith("foobar", "foo")
startsWith(10..<100, 10..<15)
startsWith(languages, ["Swift"])


/*
abs(...)
advance(...)
alignof(...)
alignofValue(...)
assert(...)
bridgeFromObjectiveC(...)
bridgeFromObjectiveCUnconditional(...)
bridgeToObjectiveC(...)
bridgeToObjectiveCUnconditional(...)
c_malloc_size(...)
c_memcpy(...)
c_putchar(...)
contains(...)
count(...)
countElements(...)
countLeadingZeros(...)
debugPrint(...)
debugPrintln(...)
distance(...)
dropFirst(...)
dropLast(...)
dump(...)
encodeBitsAsWords(...)
enumerate(...)
equal(...)
filter(...)
find(...)
getBridgedObjectiveCType(...)
getVaList(...)
indices(...)
insertionSort(...)
isBridgedToObjectiveC(...)
isBridgedVerbatimToObjectiveC(...)
isUniquelyReferenced(...)
join(...)
lexicographicalCompare(...)
map(...)
max(...)
maxElement(...)
min(...)
minElement(...)
numericCast(...)
partition(...)
posix_read(...)
posix_write(...)
print(...)
println(...)
quickSort(...)
reduce(...)
reflect(...)
reinterpretCast(...)
reverse(...)
roundUpToAlignment(...)
sizeof(...)
sizeofValue(...)
sort(...)
split(...)
startsWith(...)
strideof(...)
strideofValue(...)
swap(...)
swift_MagicMirrorData_summaryImpl(...)
swift_bufferAllocate(...)
swift_keepAlive(...)
toString(...)
transcode(...)
underestimateCount(...)
unsafeReflect(...)
withExtendedLifetime(...)
withObjectAtPlusZero(...)
withUnsafePointer(...)
withUnsafePointerToObject(...)
withUnsafePointers(...)
withVaList(...)

*/




