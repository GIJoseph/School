
let string1 = "\u{61}\u{301}\u{20DD}"
let string2 = "\u{E1}\u{20DD}"

string1 == string2

string1.characters.count
string2.characters.count

string1.endIndex
string2.endIndex

var quote = "In the end, we only regret the chances we didn't take."

let first: Character = quote[quote.startIndex]

let second = quote[quote.index(after: quote.startIndex)]

let fourth = quote[quote.index(quote.startIndex, offsetBy: 3)]

let lastIndex = quote.index(before: quote.endIndex)

let last = quote[lastIndex]

let secondToLast = quote[quote.index(lastIndex, offsetBy: -1)]

let notACharacterIndex = quote.index(lastIndex, offsetBy: 1, limitedBy: lastIndex)

let string1LastCharacterIndex = string1.index(before: string1.endIndex)
let string2LastCharacterIndex = string2.index(before: string2.endIndex)

string1[string1LastCharacterIndex]
string2[string2LastCharacterIndex]

let startIndex = quote.index(quote.startIndex, offsetBy: 12)

let range = Range(uncheckedBounds: (lower: startIndex, upper: quote.endIndex))

print(quote[range])

let rangeToReplace = startIndex..<quote.endIndex

let replacementString = "it's not the years in your life that count. It's the life in your years."

quote.replaceSubrange(rangeToReplace, with: replacementString)

print(quote)
