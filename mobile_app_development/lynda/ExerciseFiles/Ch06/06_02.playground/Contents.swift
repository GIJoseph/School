
import Foundation

class Number {
    
    static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
    
    var intValue: Int
    
    
    
    init(_ intValue: Int) {
        self.intValue = intValue
    }
}

let number = Number(1)


