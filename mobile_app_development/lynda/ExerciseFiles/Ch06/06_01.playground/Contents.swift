
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func delay(for seconds: Int, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(seconds)) { action() }
}

struct Person {
    
    let first: String
    let last: String
    
    
    
    init(first: String, last: String) {
        self.first = first
        self.last = last
    }
}

let scott = Person(first: "Scott", last: "Gardner")


