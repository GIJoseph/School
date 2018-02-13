
protocol HasMiddle {
    
    associatedtype Item
    
    func middle() -> Item?
    func middleArray() -> [Item]
    
}

extension Array : HasMiddle {
    
    typealias Item = Element
    
    private func _middleArray() -> [Item] {
        
        guard count > 0 else { return [] }
        
        let middleIndex = count / 2
        let middleArray: [Item]
        
        if count % 2 != 0 {
            middleArray = [self[middleIndex]]
        } else {
            middleArray = [self[middleIndex - 1], self[middleIndex]]
        }
        
        return middleArray
    }
    
    func middle() -> Item? {
        let middle = _middleArray()
        return middle.count == 1 ? middle.first : nil
    }
    
    func middleArray() -> [Item] {
        return _middleArray()
    }
}

let rush = ["Neil", "Geddy", "Alex"]

rush.middle()

let integers = [1, 2, 3, 4, 5, 6]

if let middle = integers.middle() {
    print(middle)
} else {
    print(integers.middleArray())
}
