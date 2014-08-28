// Optional Case Study: valuesForKeys

import Foundation

/*
extension Dictionary {
    func valuesForKeys(keys: [K], notFoundMarkery: V) -> [V] {
        // to be implemented
    }
}
*/

/* Beta 6 seems to report that .reserve doesn't exist?
extension Dictionary {
    func valuesForKeys(keys: [Key]) -> [Value?] {
            var result = [Value?]()
            result.reserve(keys.count)
            for key in keys {
                result.append(self[key])
            }
        return result
    }
}
*/

extension Dictionary {
    func valuesForKeys(keys: [Key]) -> [Value?] {
        return keys.map { self[$0] }
    }
}

let dict = ["A": "Amir", "B": "Bertha", "C": "Ching"]
dict.valuesForKeys(["A", "C"])
dict.valuesForKeys(["B", "D"])



// Nested Optionals
dict.valuesForKeys(["A", "C"]).last
dict.valuesForKeys(["B", "D"]).last
dict.valuesForKeys([]).last



// Providing a Default
extension Dictionary {
    func valuesForKeys(keys: [Key], notFoundMarker: Value) -> [Value] {
        return self.valuesForKeys(keys).map { $0 ?? notFoundMarker }
    }
}

dict.valuesForKeys(["B", "D"], notFoundMarker: "Anonymous")


