import Foundation

//Extensions
extension Double {
    var squared: Double { return self * self }//hace referencia al mismo tipo
}

let sideLenght: Double = 12.5
let area = sideLenght.squared

//print(area)

struct Car {
    let maker: String
    let model: String
    let year: Int
    
    var fuelLevel: Double {
        willSet {
            //Precondition: le pasamos una comparación, si es falso, imprime
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}
extension Car: CustomStringConvertible { //Para imprimir solo esto y no toda la información
    var description: String {
        "\(maker) - \(model)"
    }
}

//Initializers
extension Car {
    init(maker: String, model: String){
        self.init(maker: maker, model: model, year: 2023, fuelLevel: 1.0)
    }
    

        enum Era {
            case vintage, classic, modern
        }
        
        var era: Era {
            switch year {
            case ...1990:
                return .vintage
            case 1991...2000:
                return .classic
            case 2001...:
                return .modern
            default:
                return .modern
                
            }
        }

}

extension Car {
    mutating func fillFuel() {
        fuelLevel = 0.5
    }
}

var firstCar = Car(maker: "Honda",
                   model: "Civic",
                   year: 2018,
                   fuelLevel: 1.0)

print(firstCar.fuelLevel)
firstCar.fillFuel()
print(firstCar.fuelLevel)


print(firstCar)
let secondCar = Car(maker: "Ford", model: "2019")
print(secondCar)
print(firstCar.era)
