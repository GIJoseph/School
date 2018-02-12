
import Foundation

class Number {
    
    static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
    
    var intValue: Int {
        willSet(newIntValue) {
            print("newValue:", newIntValue)
        }
        
        didSet {
            print("oldValue:", oldValue)
            
            if intValue < 100 {
                intValue = 100
            }
        }
    }
    
    var intString: String {
        get {
            return Number.formatter.string(from: NSNumber(value: intValue))!
        }
        
        set {
            if let intValue = Number.formatter.number(from: newValue)?.intValue {
                self.intValue = intValue
            }
        }
    }
    
    init(_ intValue: Int) {
        self.intValue = intValue
    }
}

let number = Number(1)

number.intValue = 10

number.intValue

number.intString = "one hundred twenty-three"
