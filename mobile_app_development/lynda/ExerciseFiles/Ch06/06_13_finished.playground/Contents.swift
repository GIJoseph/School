
let quickBrownFox: String = "The quick brown fox jumped over the lazy dog"

quickBrownFox.characters.count

extension String {
    
    var length: Int {
        return characters.count
    }
}

quickBrownFox.length

extension Optional {
    
    var hasValue: Bool {
        
        switch self {
        case .none:
            return false
        case .some(_):
            return true
        }
    }
}

let optionalString: String? = "Extensions are powerful!"

optionalString.hasValue

extension String {
    
    subscript(_ index: Int) -> Character {
        let stringIndex = self.index(startIndex, offsetBy: index)
        return self[stringIndex]
    }
}

quickBrownFox[10]

final class FinalClass { }

extension FinalClass {
    
    var newValue: String {
        return "Added via extension"
    }
}

FinalClass().newValue
