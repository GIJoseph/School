
import Foundation

class Singleton {
    
    static let shared = Singleton()
    
    var value = ""
    
    private init() { }
}

let singletonA = Singleton.shared

singletonA.value = "A"

let singletonB = Singleton.shared

singletonB.value = "B"

singletonA.value == singletonB.value

class Counter {
    
    private static var instance: Counter!
    
    var total: Int
    
    private init(startingWith: Int) {
        total = startingWith
        Counter.instance = self
    }
    
    static func shared(withTotalSetTo total: Int = 0) -> Counter {
        switch instance {
        case let i?:
            i.total = total
            return i
        default:
            instance = Counter(startingWith: total)
            return instance
        }
    }
    
    func increment() -> Counter {
        total += 1
        return self
    }
    
    func reset() -> Counter {
        total = 0
        return self
    }
}

let counterA = Counter.shared()

counterA.total

let counterB = Counter.shared(withTotalSetTo: 10)

counterA.total == counterB.total

counterA.increment().increment().total
