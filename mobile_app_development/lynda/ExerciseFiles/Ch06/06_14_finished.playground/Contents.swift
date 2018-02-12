
import UIKit

class ViewController : UIViewController {
    
    var data: Set = ["First", "Second", "Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboardDidChangeFrameNotification(_:)),
            name: .UIKeyboardDidChangeFrame,
            object: nil
        )
    }
    
    func handleKeyboardDidChangeFrameNotification(_ notification: Notification) {
        // ...
    }
    
    func resetData() {
        perform(#selector(setter: ViewController.data), with: ["First", "Second", "Third"])
    }
}

let vc = ViewController()

let dataGetter = #selector(getter: ViewController.data)

let dataSetter = #selector(setter: ViewController.data)

class Book {
    
    dynamic var title = "(Untitled)"
}

let titleGetter = #selector(getter: Book.title)

let dataKeyPath = #keyPath(ViewController.data)

let predicate = NSPredicate(format: "%K contains %@", dataKeyPath, "Second")

vc.data.remove("Second")


predicate.evaluate(with: vc)

