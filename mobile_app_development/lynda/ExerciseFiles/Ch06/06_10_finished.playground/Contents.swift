
import Foundation

func lineItemAdderFor(product: String, price: Double) -> ((Int) -> String) {
    
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    func addLineItemWith(quantity: Int) -> String {
        let discountMultiplier: Double
        
        switch quantity {
        case 1...10:
            discountMultiplier = 1.0
        case 11...20:
            discountMultiplier = 0.9
        default:
            discountMultiplier = 0.8
        }
        
        let priceString = formatter.string(from: NSNumber(value: price * discountMultiplier))!
        let subtotal = Double(quantity) * price * discountMultiplier
        let subtotalString = formatter.string(from: NSNumber(value: subtotal))!
        
        return "\(quantity) of \(product) at \(priceString) each = \(subtotalString)"
    }
    
    return addLineItemWith
}

let lineItemForQuantity = lineItemAdderFor(product: "Custom T-shirt", price: 10.0)

print(lineItemForQuantity(5))

print(lineItemForQuantity(100))
