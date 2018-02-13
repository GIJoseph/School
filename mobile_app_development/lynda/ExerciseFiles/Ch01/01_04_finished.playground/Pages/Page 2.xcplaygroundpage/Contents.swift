//: [Previous](@previous)

import Foundation
import PlaygroundSupport

print(playgroundSharedDataDirectory)

let url = playgroundSharedDataDirectory.appendingPathComponent("HelloWorld.txt")

FileManager().fileExists(atPath: url.path)

if let data = FileManager.default.contents(atPath: url.path),
    let contents = String(data: data, encoding: .utf8) {
    print(contents)
}

var str = "Hello, playground"

print(spellOut(number: "12345")!)



//: [Next](@next)
