//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

var array1: [Int]

var array2: Array<Int>.Element

array1 = [Int]()


array1.append(6)
array1.append(4)
array1.append(7)

array1.count
array1[0] = 2

for x in array1 {
    print(x)
}

for x in 0..<array1.count{
    print(array1[x])
    
}
var i: Int = 0
while i < array1.count {
    print(array1[i])
    i = i + 1
}
i = 0

repeat{
    print(array1[i])
    i += 1
}while i < array1.count


var s: Set = Set<Int>()
s.insert(5)
s.insert(12)
s.insert(4)

for e in s{
    print(e)
}

s.contains(3)
s.contains(5)


var t = Set<Int>()

t.insert(3)

t.union(s)
t
t.intersection(s).isEmpty

t.isEmpty

t.isSubset(of: s)
t.isSubset(of: t)


var d: Dictionary<Int, String>

var e: [Int: String]

e = [Int: String]()

e.values
e.count


e[5] = "fifth value"
e.count
e.isEmpty

var f: [String : String]
f = [String : String]()
f["aa0000bb"] = "bob"
f["bb0202aa"] = "sue"

f["aa0000bb"]
f["bob"]
