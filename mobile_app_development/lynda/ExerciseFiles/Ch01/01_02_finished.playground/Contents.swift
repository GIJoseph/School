
import UIKit

print(spellOut(number: 123_456_789)!)

//: ![Betty](Betty.png "My coding buddy")

if let filepath = Bundle.main.path(forResource: "Crazy ones", ofType: "txt"),
    let data = FileManager.default.contents(atPath: filepath),
    let contents = String(data: data, encoding: .utf8) {
    print(contents)
}

let scott = #imageLiteral(resourceName: "ScottGardner.png")

//: [Swift blog](https://swift.org/blog/ "The Swift blog")

//: ![Swift logo](https://developer.apple.com/assets/elements/icons/128x128/swift.png "The Swift logo")

let blue = #colorLiteral(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)

let green = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
