
protocol HasTitle {
    var title: String { get }
}

struct CustomStruct {
    
    var title: String
    
    var nestedTypes = [NestedType(value: 1)]
    
    var tuple: (String, [NestedType]) {
        return (title, nestedTypes)
    }
    
    init(title: String) {
        self.title = title
    }
    
    func optionalCustomStruct() -> OptionalCustomStruct {
        return OptionalCustomStruct.some(self)
    }
    
    struct NestedType {
        var value: Int
    }
    
    subscript(index: Int) -> NestedType {
        return nestedTypes[index]
    }
}

enum OptionalCustomStruct {
    
    case none
    case some(CustomStruct)
    
}
