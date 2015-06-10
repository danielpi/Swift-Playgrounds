// When is Cheryl's Birthday
// adapted from Peter Norvig's code in http://nbviewer.ipython.org/url/norvig.com/ipython/Cheryl.ipynb

import Cocoa

// 1. Albert and Bernard just became friends with Cheryl, and they want to know when her birthday is. Cheryl gave them a list of 10 possible dates:
//       May 15       May 16       May 19
//      June 17      June 18
//      July 14      July 16
//    August 14    August 15    August 17

// 2. Cheryl then tells Albert and Bernard seperately the month and day of the birthday respectively.
// 3. Albert  : I don't know when Cheryl's birthday is, but I know that Bernard does not know too.
// 4. Bernard : At first I don't know when Cheryl's birthday is, but I know now.
// 5. Albert  : Then I also know when Cheryls birthday is.

// So when is Cheryl's Birthday?

let dates = ["May 15",    "May 16",                            "May 19",
                                      "June 17",   "June 18",
    "July 14",           "July 16",
    "August 14", "August 15", "August 17"]

func Month(date: String) -> String {
    return date.componentsSeparatedByString(" ")[0]
}
Month("May 15")

func Day(date: String) -> String {
    return date.componentsSeparatedByString(" ")[1]
}
Day("May 15")

func tell(part: String, possibleDates: [String]) -> [String] {
    return possibleDates.filter(){ $0.rangeOfString(part) != nil }
}
tell("May", possibleDates: dates)
tell("15", possibleDates: dates)
tell("18", possibleDates: dates)

func know(possibleDates: [String]) -> Bool {
    return possibleDates.count == 1
}
know(tell("15", possibleDates: dates))

// Overall Strategy
// When Cheryl tells Albert "May" then he knows there are three possibilities, but we (the puzzle solvers) don't, because we don't know what Cheryl said. So what can we do? We will consider all of the possible dates, one at a time. For example, first consider "May 15". Cheryl tells Albert "May" and Bernard "15", giving them the lists of possible birthdates shown above. We can then check whether statements 3 through 5 are true in this scenario. If they are, then "May 15" is a solution to the puzzle. Repeat the process for each of the possible dates. If all goes well, there should be exactly one solution.

func not(value: Bool) -> Bool { return !value }

// Bernard: I don't know when Cheryl's birthday is.
// Albert: I don't know when Cheryl's birthday is, but I know that Bernard doesn't know too [because he just said so].
// Bernard: At first I didn't know when Cheryl's birthday is, but I know now.
// Albert: Then I also know when Cheryl's birthday is.

// Bernard: I don't know when Cheryl's birthday is.
func statement2(date: String) -> Bool {
    let bernardPossibleDates = tell(Day(date), possibleDates: dates)
    return not(know(bernardPossibleDates))
}
let statementTwo = dates.filter(statement2)


/// Albert: I don't know when Cheryl's birthday is, but I know that Bernard doesn't know too [because he just said so].
func statement3(date: String) -> Bool {
    let albertPossibleDates = tell(Month(date), possibleDates: dates)
    return not(know(albertPossibleDates)) && not(know(albertPossibleDates.filter(statement2)))}
let statementThree = dates.filter(statement3)


// Bernard: At first I didn't know when Cheryl's birthday is, but I know now.
func statement4(date: String) -> Bool {
    let atFirst = tell(Day(date), possibleDates: dates)
    //println("\(not(know(atFirst))),\(know(filter(atFirst, statement3)))")
    return not(know(atFirst)) && know(atFirst.filter(statement3))
}
let statementFour = dates.filter(statement4)
// The dates which satisfy both statement 3 and 4 are
//let statementThreeAndFour = filter(statementThree, statement4)


// Albert: Then I also know when Cheryl's birthday is
func statement5(date: String) -> Bool {
    let months = tell(Month(date), possibleDates: dates)
    return know(months.filter(statement4))
}
let statementFive = dates.filter(statement5)


func statements3to5(date: String) -> Bool {
    return statement2(date) && statement3(date) && statement4(date) && statement5(date)
}
func cherylsBirthday(possibleDates: [String]) -> [String]