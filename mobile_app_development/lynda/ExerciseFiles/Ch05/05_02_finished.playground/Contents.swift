
enum Number {
    case integer(Int)
    case floatingPoint(Double)
    case text(String)
}

let someNumber = Number.floatingPoint(12.34)

switch someNumber {
case .floatingPoint(let n):
    print(n)
default:
    break
}

if case .floatingPoint(let n) = someNumber,
    n > 12.0 {
    print(n)
}

let someAges: [Number] = [
    .integer(19),
    .floatingPoint(20.99),
    .integer(35),
    .text("Thirty-something")
]

for age in someAges {
    switch age {
    case .integer(let a):
        print(a)
    default:
        break
    }
}

for case .integer(let a) in someAges where a > 30 {
    print(a)
}

let currentVolume: Int? = 9

if let v = currentVolume, v < 16 {
    print(v)
}

if case let v? = currentVolume, v < 16 {
    print(v)
}

if case let .some(v) = currentVolume, v < 16 {
    print(v)
}

let optionalNumbers: [Number?] = [
    nil,
    .floatingPoint(28.0),
    nil,
    .integer(37),
    nil,
    .integer(46)
]

for case .integer(let n)? in optionalNumbers where n < 40 {
    print(n)
}
