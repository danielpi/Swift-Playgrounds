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

let dates = ["May 15",    "May 16",    "May 19",
            "June 17",   "June 18",
            "July 14",   "July 16",
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

func know(possibleDates: [String]) -> Bool {
    return possibleDates.count == 1
}
know(tell("15", possibleDates: dates))

// Overall Strategy
// When Cheryl tells Albert "May" then he knows there are three possibilities, but we (the puzzle solvers) don't, because we don't know what Cheryl said. So what can we do? We will consider all of the possible dates, one at a time. For example, first consider "May 15". Cheryl tells Albert "May" and Bernard "15", giving them the lists of possible birthdates shown above. We can then check whether statements 3 through 5 are true in this scenario. If they are, then "May 15" is a solution to the puzzle. Repeat the process for each of the possible dates. If all goes well, there should be exactly one solution.

func not(value: Bool) -> Bool { return !value }


// Albert: After Cheryl told me the month of her birthdate, I didn't know her birthday. I don't know which day Cheryl told Bernard, but I know that for all of the possible dates, if Bernard is told that day, he wouldn't know the birthdate.
func statement3(date: String) -> Bool {
    let albertPossibleDates = tell(Month(date), possibleDates: dates)
    var result = not(know(albertPossibleDates)) // Confirm that Albert doesn't know the date
    for d in albertPossibleDates {
        result = result && not(know(tell(Day(d), dates)))
    }
    return result
}
statement3("May 15")
let statementThree = dates.filter(statement3)
print("Dates satisfied by Statement 3: \(statementThree)")


// Bernard: At first Cheryl told me the day, and I didn't know. Then I considered just the dates for which Albert's statement3 is true, and now I know.
func statement4(date: String) -> Bool {
    let atFirst = tell(Day(date), possibleDates: dates)
    return not(know(atFirst)) && know(atFirst.filter(statement3))
}
// The dates which satisfy both statement 3 and 4 are
let statementThreeAndFour = statementThree.filter(statement4)
print("Dates satisfied by Statement 3 & 4: \(statementThreeAndFour)")


// Albert: Then I also know when Cheryl's birthday is
func statement5(date: String) -> Bool {
    let months = tell(Month(date), possibleDates: dates)
    return know(months.filter(statement4))
}
statement5("May 15")
let statementFive = dates.filter(statement5)
print("Dates satisfied by Statement 5: \(statementFive)")

func statements3to5(date: String) -> Bool {
    return statement3(date) && statement4(date) && statement5(date)
}
func cherylsBirthday(possibleDates: [String]) -> [String] {
    return possibleDates.filter