
enum Employee {
    
    indirect case some(name: String, title: String, manager: Employee?)
    case none
    
    func printReportingStructure() {
        if case let .some(name, title, manager) = self {
            print("\(name), \(title)", terminator: "")
            
            if let manager = manager {
                print(" -> ", terminator: "")
                manager.printReportingStructure()
            }
        }
    }
}

let charlotte = Employee.some(name: "Charlotte", title: "CEO", manager: nil)
let lori = Employee.some(name: "Lori", title: "VP", manager: charlotte)
let scott = Employee.some(name: "Scott", title: "Developer", manager: lori)

scott.printReportingStructure()
