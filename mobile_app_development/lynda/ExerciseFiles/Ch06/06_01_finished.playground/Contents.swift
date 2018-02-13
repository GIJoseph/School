
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func delay(for seconds: Int, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(seconds)) { action() }
}

struct Person {
    
    let first: String
    let last: String
    
    lazy var created = Date()
    
    var now: Date {
        return Date()
    }
    
    lazy var casualGreeting: String = {
        return "Hey \(self.first)!"
    }()
    
    lazy var luckyNumber: Int? = {
        // Simulating complex algorithm
        for i in 0...50_000_000 { i }
        
        return (self.first + self.last).hashValue % 100
    }()
    
    init(first: String, last: String) {
        self.first = first
        self.last = last
    }
}

var scott = Person(first: "Scott", last: "Gardner")

print("Created: ", scott.created)
print("Now:", scott.now)

delay(for: 5) {
    print("Created: ", scott.created)
    print("Now:", scott.now)
}

scott.casualGreeting

scott.luckyNumber

