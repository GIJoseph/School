//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String) -> String{
    let greeting = "Hello, \(person)!"
    
    return greeting
}


print(greet(person: "Joseph"))


func sayHello() -> String{
    return """
    Hello,
    
    World!
    """
}
print(sayHello())

func greet(person: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted{
        return greet(person: person)
    }
    else{
        return sayHello()
    }
}

greet(person: "Joe", alreadyGreeted: false)

func printGreeting(person:String){
    print("Hello, \(person)")
    
}
printGreeting(person: "Joe")

var tuple: (Int, Int) = (num1: 20, num2: 40)
tuple.0
func minMax(array: [Int]) -> (min: Int, max: Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }
        else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let r = minMax(array: [45, 21, 13, 88, 12, 77, 33])
r.max



func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}
greet(person: "Joe", from: "Adams")

func greetAgain(_ person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

greetAgain("Joseph", from: "Adams")


let digitNames = [ 0: "zero", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five"]
func test(number: Int) -> String {
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
test(number: 532)



func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts(_:_:)

print("Result: \(mathFunction(2,3))")


func stepForward(_ input: Double,_ yes: Int) -> Int {
    return Int(input + 1)
}
func stepBackward(_ input: Double,_ yes: Int) -> Int {
    return Int(input - 1)
}

func chooseStepFunction(backward: Bool) -> (Double, Int) -> Int{
    let something = backward ? stepBackward : stepForward
    return something
}
var currentValue = 5
/*
let MoveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(Double(currentValue), 1)
}
*/
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 5
swapTwoInts(&someInt, &anotherInt)
print("someInt: \(someInt) anotherInt: \(anotherInt)")


func chooseStepFunction2(backward: Bool) -> (Int) -> Int{
    func stepForward(input: Int) -> Int{
        return input + 1
    }
    func stepBackward(input: Int) -> Int{
        return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

currentValue = 4
var moveNearerToZero = chooseStepFunction2(backward: currentValue > 0)
print("counting to zero: ")
while currentValue != 0{
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}

let numbers = [13, 55, 510]

let strings = numbers.map({(number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
    }
)
print(strings)

let incArray = numbers.map({(number) -> Int in
    return number + 1
})

let sqrArray = numbers.map({(number) -> Int in
    return number * number
})
print(sqrArray)
//func makeIncrementer(forIncrement amount: Int) -> () -> Int{}








