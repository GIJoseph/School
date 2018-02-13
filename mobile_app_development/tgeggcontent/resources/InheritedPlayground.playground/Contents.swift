//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Stack<Element> {
    var items = [Element]()
    
    func push(_ item: Element) {
        items.append(item)
    }
    
    func pop() -> Element {
        return items.removeLast()
    }
}

class SearchableStack<Element: Equatable>: Stack<Element> {
    func find(_ item: Element) -> Bool {
        for element in items {
            if element == item {
                return true
            }
        }
        return false
    }
    override func pop() -> Element {
        print("searchable pop")
        return items.removeFirst()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

var fromTheTop = stackOfStrings.pop()

var stackOfInts = Stack<Int>()
stackOfInts.push(1)
stackOfInts.push(2)
stackOfInts.push(3)
stackOfInts.push(4)

//fromTheTop = stackOfInts.pop()
var fromTheTop2 = stackOfInts.pop()

stackOfInts = SearchableStack<Int>()
stackOfInts.push(1)
(stackOfInts as! SearchableStack).push(2)
stackOfInts.push(3)
stackOfInts.push(4)

fromTheTop2 = stackOfInts.pop()
fromTheTop2 = (stackOfInts as! SearchableStack).pop()
//stackOfInts.find(3)
(stackOfInts as! SearchableStack).find(3)
(stackOfInts as! SearchableStack).find(1)





