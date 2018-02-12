
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
    func accelerateTo(speed: Int)
}


