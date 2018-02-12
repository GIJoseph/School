
import UIKit
import ExternalTarget

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customStruct = CustomStruct(title: "CustomStruct")
        
        _ = customStruct.title
        
//        customStruct.title = "New Title"
        
        _ = ExternalCustomClass()
        
        _ = ExternalCustomStruct()
        
        
    }

}
