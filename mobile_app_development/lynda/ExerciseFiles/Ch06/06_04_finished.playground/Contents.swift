
class ClassA {
    var aValue = 867_5309
}

class ClassB : ClassA {
    var bValue = "Stay classy San Diego"
}

let a = ClassA()
let b = ClassB()

let array = [a, b]

array[0].aValue

array[1].aValue

array[1] is ClassB

(array[1] as! ClassB).bValue

if let classBInstance = array[1] as? ClassB {
    classBInstance.bValue
}

let reallyAClassBInstance = ClassB() as ClassA

//reallyAClassBInstance.bValue

import Foundation

func doSomethingWith(nsString: NSString) { }

let helloWorld = "Hello, world!"

doSomethingWith(nsString: helloWorld as NSString)
