
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



let integers = [1, 2, 3, 4, 5]



let comment = "Great article!! Very insightful."



let paddedComment = ">>>This is a comment<<<"


