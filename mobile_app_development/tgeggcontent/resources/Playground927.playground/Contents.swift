//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}
let x: Int = 13

print(greet(person: "Radagast"))

func greet(someone: String) -> String {
    let greeting = "Hello again, \(someone)!"
    return greeting
}

greet(someone: "Arwen")

func sayHello() -> String {
    return """
    hello,
    
    world!
    """
}

print(sayHello())

func greet(person: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted {
        return greet(someone: person)
    }
    else {
        return greet(person: person)
    }
}

greet(person: "Arwen", alreadyGreeted: false)

func printGreeting(person: String) -> Void {
    print("Hello, \(person)!")
}
printGreeting(person: "Radagast")

func printAnotherGreeting(person: String) {
    print("Hello again, \(person)!")
}
printAnotherGreeting(person: "Milo")

func min(array: [Int]) -> Int {
    var currentMin = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
    }
    return currentMin
}

min(array: [45, 21, 13, 88, 12, 77, 33])

func minMax(array: [Int]) -> (Int, Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let result = minMax(array: [45, 21, 13, 88, 12, 77, 33])
result.0
result.1

func maxMin(array: [Int]) -> (max: Int, min: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMax, currentMin)
}
let r = maxMin(array: [45, 21, 13, 88, 12, 77, 33])
r.min
r.max


func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

greet(person: "Radagast", from: "Eau Claire")

func greetAgain(_ person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

greetAgain("Arwen", from: "Eau Claire")

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2,3,4,5,8,9, 10, 33)

let digitNames = [ 0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five"]

func test(number: Int) -> String {
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
test(number: 532)

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts(_:_:)

print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts(_:_:)

print("Result: \(mathFunction(2,3))")

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts(_:_:), 3, 5)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = -3
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 5
swapTwoInts(&someInt, &anotherInt)

print("someInt: \(someInt) anotherInt: \(anotherInt)")

func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}

currentValue = 4
moveNearerToZero = chooseStepFunction2(backward: currentValue > 0)
print("counting to zero:")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}

let numbers = [13, 55, 510]

let strings = numbers.map({(number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output}
)
print(strings)

let incArray = numbers.map({(number) -> Int in
    return number + 1
})
print(incArray)


