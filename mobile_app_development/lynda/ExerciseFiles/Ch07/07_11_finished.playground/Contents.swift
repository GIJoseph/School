
extension RawRepresentable where RawValue : Integer {
    
    func next(offset: Self.RawValue = 1) -> Self? {
        return Self(rawValue: rawValue + offset)
    }
    
    func previous(offset: Self.RawValue = 1) -> Self? {
        return Self(rawValue: rawValue - offset)
    }
}

enum Number : UInt8 {
    
    case one = 1, two, three, four, five
}

Number.one.next()

if let five = Number.two.next(offset: 3) {
    print(five)
}
Number.five.previous(offset: 4)

Number(rawValue: 1)?.previous()

