
import Foundation

struct Thing {
    
    let title: String
    
    init(_ title: Int) {
        self.title = "\(type(of:self)) \(title)"
    }
}

let numbers = [1, 2, 3]

let strings = ["One", "Two", "Three"]

let things = [Thing(1), Thing(2), Thing(3)]

class ItemHolder<T> {
    
    var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    func randomItem() -> T {
        let index = Int(arc4random_uniform(UInt32(items.count)))
        return items[index]
    }
}

let numbersHolder = ItemHolder(items: numbers)

let thingsHolder = ItemHolder(items: things)

numbersHolder.randomItem()

thingsHolder.randomItem().title

func randomItemFrom<T>(_ items: [T]) -> T {
    let index = Int(arc4random_uniform(UInt32(items.count)))
    return items[index]
}

randomItemFrom(["Alpha", "Bravo", "Charlie"])

typealias Vector<T> = (a: T, b: T, c: T)

let intVector = Vector(1, 2, 3)

intVector.a
intVector.b
intVector.c
