
import Foundation

protocol HasTitle {
    
    var title: String { get }
    var subtitle: String? { get }
}

protocol Readable : HasTitle {
    var author: String { get }
    init(author: String, title: String, subtitle: String?)
}

protocol Purchasable : HasTitle, CustomStringConvertible {
    
    var price: Double { get }
    var priceString: String { get }
    static var currencyFormatter: NumberFormatter { get }
}

class Book : Readable, Purchasable {
    
    static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    let author: String
    let title: String
    let subtitle: String?
    var price: Double = 0.0
    
    var priceString: String {
        return Book.currencyFormatter.string(from: NSNumber(value: price))!
    }
    
    var description: String {
        let subtitleString = subtitle != nil ? "\n  " + subtitle! : ""
        return title + subtitleString + "\n\tBy: " + author + "\n\tPrice: $\(price)"
    }
    
    required init(author: String, title: String, subtitle: String? = nil) {
        self.author = author
        self.title = title
        self.subtitle = subtitle
    }
}

let book = Book(author: "Edwin Lefevre", title: "Reminiscences of a Stock Operator")

book.price = 125.0

print(book)

class SomeClass {
    
    // Required by HasTitle
    var subtitle: String?
    
}

extension SomeClass : HasTitle {
    
    var title: String {
        return String(describing: SomeClass.self)
    }
}
