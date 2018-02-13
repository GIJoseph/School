
protocol DemonstratesProtocol {
    
    var value: Int { get set }
    
    init?(x: Int, y: String?)
    
    func spellOut(_ input: Int) -> String?
    
    subscript(x: Int, y: Int) -> Int { get set }
    
}

protocol SomeOtherProtocol {
    // Requirements
}

protocol DemonstratesProtocolInheritance: DemonstratesProtocol, SomeOtherProtocol {
    // Additional requirements
}
