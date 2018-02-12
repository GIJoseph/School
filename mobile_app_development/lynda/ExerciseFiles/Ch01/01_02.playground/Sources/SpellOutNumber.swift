import Foundation

/**
 Converts any numeric literal (e.g., 1) or string containing a numeric literal (e.g., "1"), into a spelled-out number string (e.g., "one"). [Source on GitHub](http://bit.ly/SwiftSpellOutNumber)
 - parameter number: a numeric literal, or string containing a numeric literal
 - returns: String?
 */
public func spellOut<N>(number: N) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    switch number {
    case is Int, is UInt, is Float, is Double:
        return formatter.string(from: number as! NSNumber)
    case is String:
        if let number = Double((number as! String)) {
            return formatter.string(from: NSNumber(floatLiteral: number))
        }
    default:
        break
    }
    
    return nil
}
