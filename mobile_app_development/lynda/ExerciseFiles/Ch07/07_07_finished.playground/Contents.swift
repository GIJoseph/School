
enum Option : Int {

  case a = 1
  case b = 2
  case c = 4

}

let allOptions = Option.a.rawValue | Option.b.rawValue | Option.c.rawValue

struct Options : OptionSet {
    
    let rawValue: Int
    
    static let a = Options(rawValue: 1 << 0)
    static let b = Options(rawValue: 1 << 1)
    static let c = Options(rawValue: 1 << 2)
    
    static let aAndC: Options = [.a, .c]
    static let all: Options = [.a, .b, .c]
    
}

let options: Options = [.a, .b, .c]

options.rawValue

var someOptions: Options = [.a]

someOptions.insert(.b)
someOptions.insert(.b)

someOptions.remove(.b)

someOptions.contains(.b)

someOptions.rawValue

let aAndC = Options.aAndC

aAndC.rawValue
