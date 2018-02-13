//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class MyClass {
    var count: Int
    var name: String?
    var info: String!
    
    init() {
        count = 10;
    }
    
    func getName() -> String? {
        return name;
    }
}

var l: MyClass = MyClass()

print("\(l.count)")
print("\(l.getName())")
print("\(l.info)")

if let s = l.getName() {
    print("name is \(s)")
}
l.name = "you"
if let s = l.getName() {
    print("name is \(s)")
}

var m: MyClass? = MyClass()

print("\(m!.count)")
print("\(m?.getName())")
print("\(m?.info)")

m?.name = "me"

print("\(m!.count)")
print("\(m?.getName())")
print("\(m!.getName())")
print("\(m?.getName()!)")
print("\(m!.getName()!)")
print("\(m?.info)")


var n: MyClass?
//print("\(n!.count)")
print("\(n?.getName())")
print("\(n?.info)")
n?.count = 5
//n!.count = 5


// Optional Chaining

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
