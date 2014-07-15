// Swift Standard Library - Free Functions

print("Hello, world!\n")
println("Hello, world!")

var array = [5, 1, 6, 4, 2, 3]
sort(&array)
array
// You can't sort a constant array because sort mutates the array it operates on.

array = [5, 1, 6, 4, 2, 3]
var result = sorted(array)

array = [5, 1, 6, 4, 2, 3]
sort(&array) { $0 > $1 }
array


