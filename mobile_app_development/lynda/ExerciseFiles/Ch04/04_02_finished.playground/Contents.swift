
let range = (1...5)

for i in range {
    print(i)
    
    if i > 3 {
        break
    }
}

// No guarantees, so avoid repeatedly iterating over a sequence
for i in range {
    print(i)
}

let array = [1, 2, 3, 4, 5][3]

let runners = ["Charlotte", "Lori", "Scott"]

var raceResults = [String: Int]()

for (runner, place) in zip(runners, 1...5) {
    raceResults[runner] = place
}

print(raceResults)

let firstEvenNumber = [1, 3, 4, 6].first { $0 % 2 == 0 }

print(firstEvenNumber ?? "No even numbers in array")

let letters = ["a", "b", "c", "d", "e"]

letters.prefix(upTo: 3) == letters[0..<3]

letters.prefix(through: 3) == letters[0...3]



let integers = [1, 2, 3, 4, 5]

integers.prefix(10)



let comment = "Great article!! Very insightful."

let maxLength = 50

let truncatedComment = String(comment.characters.prefix(maxLength)) +
    (comment.characters.count > maxLength ? "..." : "")

print(truncatedComment)

integers.dropFirst()

integers.dropLast(20)



let paddedComment = ">>>This is a comment<<<"

let s = String(paddedComment.characters.dropFirst(3).dropLast(3))

print(s)

//[2, 4, 6, 7, 9, 10].prefix(while: { $0 % 2 == 0 }) // [2, 4, 6]
//
//[1, 2, 3, 4, 6, 9].drop { $0 % 2 != 0 } // [4, 6, 9]

