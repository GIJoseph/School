
import Foundation

@objc protocol HasTitle {
    
    var title: String { get }
    @objc optional var subtitle: String? { get }
    
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

protocol Ratable : class {
    
    var ratings: [UInt] { get set }
    func add(rating: UInt)
    func averageRating() -> Double
    
}

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

class Book : Readable, Purchasable, Ratable {
    
    static var currencyFormatter = formatter
    
    var author: String
    var title: String
    var subtitle: String?
    var price: Double = 0.0
    var ratings = [UInt]()
    
    var priceString: String {
        return Book.currencyFormatter.string(from: NSNumber(value: price))!
    }
    
    var description: String {
        let subtitleString = subtitle != nil ? "\n  " + subtitle! : ""
        return title + subtitleString + "\n\tBy: " + author + "\n\tAvg rating: \(averageRating())" + "\n\tPrice: $\(price)"
    }
    
    required init(author: String, title: String, subtitle: String? = nil) {
        self.author = author
        self.title = title
        self.subtitle = subtitle
    }
    
    func add(rating: UInt) {
        let r = rating < 6 ? rating : 5
        ratings.append(r)
    }
    
    func averageRating() -> Double {
        guard ratings.count > 0 else { return 0 }
        return Double(ratings.reduce(0, +)) / Double(ratings.count)
    }
}

let book = Book(author: "Edwin Lefevre", title: "Reminiscences of a Stock Operator")

book.price = 125.0

book.add(rating: 5)
book.add(rating: 4)
book.add(rating: 3)

print(book)

class BluRay : Purchasable, Ratable {
    
    static var currencyFormatter = formatter
    
    static var timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var title: String = ""
    var price: Double
    var ratings = [UInt]()
    let runtime: TimeInterval
    
    var priceString: String {
        return Book.currencyFormatter.string(from: NSNumber(value: price))!
    }
    
    var runtimeString: String {
        let formatter = BluRay.timeFormatter
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: runtime)!
    }
    
    var description: String {
        return title + "\n\tRun time: \(runtimeString)" + "\n\tAvg rating: \(averageRating())" + "\n\tPrice: \(priceString)"
    }
    
    init(title: String, runtime: TimeInterval, price: Double) {
        self.title = title
        self.runtime = runtime
        self.price = price
    }
    
    func add(rating: UInt) {
        let r = rating < 6 ? rating : 5
        ratings.append(r)
    }
    
    func averageRating() -> Double {
        guard ratings.count > 0 else { return 0 }
        return Double(ratings.reduce(0, +)) / Double(ratings.count)
    }
}

let bluRay = BluRay(title: "Star Wars: The Force Awakens", runtime: 136.0 * 60.0, price: 24.96)

bluRay.ratings = [5, 5, 5]

print(bluRay)

let cart: [Purchasable] = [book, bluRay]

for item in cart {
    print(item.title, item.priceString, separator: ": ")
    
//    print(item.averageRating())
}

typealias LineItemable = Purchasable & Ratable

let cart2: [LineItemable] = [book, bluRay]

func printLineItemsFor(cart: [LineItemable]) {
    for item in cart {
        print(item.title, item.priceString, item.averageRating())
    }
}

printLineItemsFor(cart: cart2)
