//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

func throwVendingMachineError() throws {
    throw VendingMachineError.insufficientFunds(coinsNeeded: 10)
}
do {
    try throwVendingMachineError()
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.insufficientFunds(_) {
    print("Insufficient funds")
} catch is VendingMachineError {
    print("Some other error")
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let v = VendingMachine()
v.coinsDeposited = 20
try v.vend(itemNamed: "Chips")

let favoriteSnacks = [
    "Sue": "Chips",
    "Bob": "Licorice",
    "Evie": "Pretzels",
]

// nil-coalescing operator (??)

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Cookie"
    try vendingMachine.vend(itemNamed: snackName)
}

try! buyFavoriteSnack(person: "Evie", vendingMachine: v)
try? buyFavoriteSnack(person: "Emma", vendingMachine: v)

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Sue", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

func someThrowingFunction() throws -> Int {
    // ...
    return 0
}

// Converting an error to an optional value (nil if error thrown)
let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

// Handle all errors the same way
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
func fetchDataFromDisk() throws -> Data? {
    return nil
}
func fetchDataFromServer() throws -> Data? {
    return nil
}

// Disable error propagation
enum ImgLoadingError: Error {
    case notFound
    case invalidInput(String)
}
func loadImage(atPath: String) throws -> Int {
    if atPath == "no image" {
        throw ImgLoadingError.invalidInput(atPath)
    }
    else {
        return 0
    }
}
func noThrowLoadImage(atPath: String) -> Int {
    return try! loadImage(atPath: atPath)
}

let photo1 = try loadImage(atPath: "photo.jpg")
let photo2 = noThrowLoadImage(atPath: "photo.jpg")
//let photo3 = noThrowLoadImage(atPath: "no image")




