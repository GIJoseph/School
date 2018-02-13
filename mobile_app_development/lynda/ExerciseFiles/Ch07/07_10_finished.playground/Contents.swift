
protocol Vehicular {
    var passengerCapacity: Int { get }
}

protocol Motorized {
    var horsepower: Int { get }
}

protocol Wheeled {
    var numberOfWheels: Int { get }
}

protocol Drivable {
    var currentSpeed: Int { get set }
    mutating func accelerateTo(speed: Int)
}

extension Vehicular {
    var passengerCapacity: Int {
        return 4
    }
}

extension Motorized {
    var horsepower: Int {
        return 100
    }
}

extension Wheeled {
    var numberOfWheels: Int {
        return 4
    }
}

extension Drivable {
    
    mutating func accelerateTo(speed: Int) {
        currentSpeed = speed
    }
}

class Sedan : Vehicular, Motorized, Wheeled, Drivable {
    
    var currentSpeed: Int = 0
    
    var horsepower: Int = 200
    
    func accelerateTo(speed: Int) {
        print("New speed:", speed)
        currentSpeed = speed
    }
}

var sedan = Sedan()

sedan.horsepower
sedan.numberOfWheels
sedan.passengerCapacity

sedan.accelerateTo(speed: 100)

sedan.currentSpeed
