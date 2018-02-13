//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Celsius: NSObject{
    private var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celcius: Double){
        temperatureInCelsius = celcius
    }
    func setTemp(temp:Double){
        temperatureInCelsius = temp
    }
    func getTemp() -> Double{
        return temperatureInCelsius
    }
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    
    //var anotherTemperature = Celcius()
    
    
}
