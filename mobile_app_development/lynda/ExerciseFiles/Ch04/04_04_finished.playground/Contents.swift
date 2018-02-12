
func printOut(_ value: Any) {
    print(value)
}

[1, 2, 3].forEach(printOut) // { print($0) }

(1...3).forEach(printOut)

let double = { $0 * 2 }

let newArray = [1, 2, 3].map(double) // { $0 * 2 }

let isEven = { $0 % 2 == 0 }

let evens = [1, 2, 3, 4, 5, 6, 7, 8].filter(isEven)

[1, 2, 4, 8, 16].reduce(0, +)

let integers = [1, nil, 2, nil, 3].flatMap { $0 }

print(integers)

let flattenAndReduce: ([Double]) -> Double = { $0.reduce(0, +) }

let doubles = [[1.0, 2.0], [3.0, 4.0, 5.0], [6.0]].flatMap(flattenAndReduce)

print(doubles)

let dictionary = ["one": 1, "two": 2, "four": 4]

let uppercaseKeys = dictionary.map { $0.key.uppercased() }

print(uppercaseKeys)

let sumOfValues = dictionary.reduce(0) { $0 + $1.value }

print(sumOfValues)
