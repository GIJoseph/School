
import Foundation

func addLineItem(product: String, price: Double)(quantity: Int) -> String {
    let discountMultiplier: Double
    
    switch quantity {
    case 1...10:
        discountMultiplier = 1.0
    case 11...20:
        discountMultiplier = 0.9
    default:
        discountMultiplier = 0.8
    }
    
    return String(format: "\(quantity) of \(product) at $%.2f each = $%.2f", price * discountMultiplier, Double(quantity) * price * discountMultiplier)
}


