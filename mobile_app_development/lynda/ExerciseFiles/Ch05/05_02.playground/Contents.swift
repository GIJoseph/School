
enum Number {
    case integer(Int)
    case floatingPoint(Double)
    case text(String)
}

let someNumber = Number.floatingPoint(12.34)



let someAges: [Number] = [
    .integer(19),
    .floatingPoint(20.99),
    .integer(35),
    .text("Thirty-something")
]



let currentVolume: Int? = 9



let optionalNumbers: [Number?] = [
    nil,
    .floatingPoint(28.0),
    nil,
    .integer(37),
    nil,
    .integer(46)
]


