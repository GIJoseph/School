
struct Counter {
    
    var total = 0
    
    mutating func increment(by amount: Int = 1) -> Counter {
        total += amount
        return self
    }
    
    mutating func reset() -> Counter {
        self = Counter()
        return self
    }
}

var counter = Counter()

counter.increment().total

counter.increment(by: 4).total

//counter.increment().increment()

(0...2).forEach { _ in _ = counter.increment() }

counter.total

counter.reset().total
