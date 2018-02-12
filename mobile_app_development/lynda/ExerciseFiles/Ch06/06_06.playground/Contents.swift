
struct Coordinate3D : Hashable {
    
    let x, y, z: Int
    
    var hashValue: Int {
        return x | y | z
    }
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    static func ==(lhs: Coordinate3D, rhs: Coordinate3D) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
}

struct Matrix3D {
    
    let numberOfRows, numberOfColumns, numberOfLayers: Int
    var coordinates = [Coordinate3D: String]()
    
    init(numberOfRows: Int, numberOfColumns: Int, numberOfLayers: Int) {
        self.numberOfRows = numberOfRows
        self.numberOfColumns = numberOfColumns
        self.numberOfLayers = numberOfLayers
    }
    
    func isValid(_ coordinate: Coordinate3D) -> Bool {
        let c = (x: coordinate.x, y: coordinate.y, z: coordinate.z)
        
        let xIsValid = c.x >= -numberOfColumns / 2 && c.x <= numberOfColumns / 2
        let yIsValid = c.y >= -numberOfLayers / 2 && c.y <= numberOfLayers / 2
        let zIsValid = c.z >= -numberOfRows / 2 && c.z <= numberOfRows / 2
        
        return xIsValid && yIsValid && zIsValid
    }
    
    
}

var matrix3d = Matrix3D(numberOfRows: 10, numberOfColumns: 10, numberOfLayers: 10)


