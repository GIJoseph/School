
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
    
    init?(_ stringValue: String) {
        guard let intValue = Number.formatter.number(from: stringValue)?.intValue else {
            return nil
        }
        
        self.intValue = intValue
    }
}

let number = Number(1)

number.intValue = 10

number.intValue

number.intString = "one hundred twenty-three"

if let nineteen99 = Number("nineteen ninety-nine") {
    print(nineteen99.intValue)
}

enum Decimal : Double {
    case one = 1, two, three
}

let two = Decimal(rawValue: 2.0)

