
public class ExternalCustomClass {
    
    var title: String
        
    public init(title: String = "ExternalCustomClass") {
        self.title = title
    }
    
    func printTitle() {
        print(title)
    }
}

public struct ExternalCustomStruct {
    
    var title = "ExternalCustomStruct"
    
    public init() { }
    
}
