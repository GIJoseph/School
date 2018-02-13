//: Playground - noun: a place where people can play

import UIKit


let fileName = "words"
let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
let fileURL = url.appendingPathComponent(fileName).appendingPathExtension("txt")

print("File Path: \(fileURL.path)")

var readString = ""

do {
    readString = try String(contentsOf: fileURL)
    
}catch{
    print("failed to read")
}
readString
