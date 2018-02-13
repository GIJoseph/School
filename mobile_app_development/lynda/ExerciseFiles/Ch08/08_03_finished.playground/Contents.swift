
protocol Edible {
    
    var name: String { get }
    var caloriesPerServing: Int { get }
    
}

typealias Describable = CustomStringConvertible

struct Ingredient : Edible, CustomStringConvertible {
    
    let name: String
    var caloriesPerServing: Int
    
    var description: String {
        return "\(name) - \(caloriesPerServing) calories per serving"
    }
    
    init(_ name: String, _ caloriesPerServing: Int) {
        self.name = name
        self.caloriesPerServing = caloriesPerServing
    }
}

let chocolateChips = Ingredient("Chocolate chips", 201)
let driedFruit = Ingredient("Dried fruit", 85)
let granola = Ingredient("Granola", 113)
let mixedNuts = Ingredient("Mixed nuts", 219)
let miniPretzels = Ingredient("Mini pretzels", 110)

//struct TrailMix<T, U> : Describable where
//    T: Edible & Describable,
//    U: Integer {
struct TrailMix<T: Edible & Describable> : Describable {
    
    let ingredients: [T]
    
    var description: String {
        var totalCaloriesPerServing = 0.0
        var combinedDescription = ""
        
        ingredients.forEach {
            totalCaloriesPerServing += Double($0.caloriesPerServing) / Double(ingredients.count)
            
            combinedDescription += "\t\($0.description)\n"
        }
        
        return "Trail mix, calories per serving: \(totalCaloriesPerServing)\n  Ingredients:\n\(combinedDescription)"
    }
}

let trailMix = TrailMix(ingredients: [chocolateChips, driedFruit, granola, mixedNuts, miniPretzels])

print(trailMix)

typealias Vector<T : SignedNumber> = (a: T, b: T, c: T)

let intVector = Vector(1, 2, 3)

let doubleVector = Vector(1.2, 3.4, 5.6)

//let stringVector = Vector("This", "won't", "work")

