//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Point {
    var x = 0.0, y = 0.0
    /*
     init(x: Double, y: Double) {
     self.x = x
     self.y = y
     }
     */
    static func == (left: Point, right: Point) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Point, right: Point) -> Bool {
        return !(left == right)
    }
    static func + (left: Point, right: Point) -> Point {
        return Point(x: left.x + right.x, y: left.y + right.y)
    }
    static func - (left: Point, right: Point) -> Point {
        return Point(x: left.x - right.x, y: left.y - right.y)
    }
    static prefix func - (point: Point) -> Point {
        return Point(x: -point.x, y: -point.y)
    }
}

infix operator >>
prefix operator +++
class Size {
    var width = 0.0, height = 0.0
    init() {
        
    }
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    static func == (left: Size, right: Size) -> Bool {
        return (left.width == right.width) && (left.height == right.height)
    }
    static func != (left: Size, right: Size) -> Bool {
        return !(left == right)
    }
    static func + (left: Size, right: Size) -> Size {
        return Size(width: left.width + right.width, height: left.height + right.height)
    }
    static func - (left: Size, right: Size) -> Size {
        return Size(width: left.width - right.width, height: left.height - right.height)
    }
    static prefix func - (size: Size) -> Size {
        return Size(width: -size.width, height: -size.height)
    }
    static prefix func +++ (size: inout Size) -> Size {
        size.width += size.width
        size.height += size.height
        return size
    }
    static func >> (left: Size, right: Size) -> Size {
        return (left.width * left.height > right.width * right.height) ? left : right
    }
}

var p1 = Point(x: 10.0, y: 20.0)
var p2 = Point(x: 100.0, y: 0.0)
var p3 = p2
var p4 = p1 + p2
var p5 = p1 - p2
var p6 = -p1

print("p1 == p2? \(p1 == p2)")
print("p2 == p3? \(p2 == p3)")
print("p1: x \(p1.x) and y \(p1.y)")
print("p2: x \(p2.x) and y \(p2.y)")
print("p3: x \(p3.x) and y \(p3.y)")
print("p4: x \(p4.x) and y \(p4.y)")
print("p5: x \(p5.x) and y \(p5.y)")
print("p6: x \(p6.x) and y \(p6.y)")

var s1 = Size(width: 2.0, height: 3.0)
var s2 = Size(width: 9.0, height: 4.0)
var s3 = s2
var s4 = s1 + s2
var s5 = s1 - s2
var s6 = -s1
var s7 = Size(width: 9.0, height: 4.0)

print("s1 == s2? \(s1 == s2)")
print("s2 == s3? \(s2 == s3)")
print("s2 === s3? \(s2 === s3)")
print("s2 == s7? \(s2 == s7)")
print("s2 === s7? \(s2 === s7)")
print("s1: width \(s1.width) and height \(s1.height)")
print("s2: width \(s2.width) and height \(s2.height)")
print("s3: width \(s3.width) and height \(s3.height)")
print("s4: width \(s4.width) and height \(s4.height)")
print("s5: width \(s5.width) and height \(s5.height)")
print("s6: width \(s6.width) and height \(s6.height)")

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

class Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    static func == (left: Rect, right: Rect) -> Bool {
        return (left.origin == right.origin) && (left.size == right.size)
    }
    static func != (left: Rect, right: Rect) -> Bool {
        return !(left == right)
    }
}
class AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

class AClass {
    let name: String
    init(name: String) {
        self.name = name
        print("AClass initialized for \(name)")
    }
    public func aMethod() -> Void {
        print("aMethod invoked by \(name)")
    }
}

class SomeClass {
    let constantInstanceProperty = "A value"
    let anotherConstant: String
    let thirdConstant: String
    var variableInstanceProperty = "Another value"
    
    static let storedTypeProperty = "Some value"
    static var computedTypeProperty: String {
        return storedTypeProperty + " that is computed"
    }
    class var overrideableComputedTypeProperty: String {
        return storedTypeProperty + " that is overrideable"
    }
    
    var nonLazyVariable = AClass(name: "nonLazyVariable")
    lazy var lazyVariable = AClass(name: "lazyVariable")
    
    init(value: String) {
        anotherConstant = "Only value"
        thirdConstant = value
    }
}

let s = SomeClass(value: "whatever")
s.variableInstanceProperty = "Yet another value"


print(SomeClass.storedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)

//s.lazyVariable.aMethod()


class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


