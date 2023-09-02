//: [Previous](@previous)

import Foundation

class Vehicle {
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    let wheels: Int?
    
    //Inicializador designado
    init(brand: String, model: String, owner: String, serialNumber: String, wheels: Int?){
        self.brand = brand
        self.model = model
        self.owner = owner
        self.serialNumber = serialNumber
        self.wheels = wheels
    }
    
    var isMoving: Bool = false
    
    //métodos de instancia
    func move() {
        isMoving = true
    }
    func stop() {
        isMoving = false
    }
    
    static func describe(){
        print("a vehicle!")
    }
    
    //Se va a utilizar en un rato
    func makeNoise() -> String {"Noise"}
    
    var type: String{
        // ?? significa me das el 1er valor (wheels) si tiene algo, sino dame 0
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (name: String, serialNumber: String, type: String)? {
        get { //Computamos algo
            if let owner = owner {
                return (owner, serialNumber, type)
            }
            return nil //SI no hay propietario, damos un nil
        }
        set(newRegistration){
            if let newRegistration = newRegistration {
                owner = newRegistration.name
            }
        }
    }
}

let myVehicle = Vehicle(brand: "Nissan", model: "2023", owner: "Brandon", serialNumber: "12fger54g", wheels: nil)

//Al poner registration entonces entra el set y toma el valor nuevo -> owner
//Solo modifica el owner, porque es lo que se puso dentro del set
myVehicle.registration = (name: "Grecia", serialNumber: "1111", type: "other")
myVehicle.move()
myVehicle.isMoving
Vehicle.describe() //Por ser una función estática, no necesita una instancia

//Herencia: Car hereda de Vehicle
class Car: Vehicle {
    override var type: String{
        return "Car"
    }
    
    var isElectric: Bool
    
    init(electric: Bool){
        //Primero el actual atributo, después el super()
        self.isElectric = electric
        super.init(brand: "Toyota", model: "2023", owner: "Juan", serialNumber: "wuhjwhjwhj", wheels: 4)
    }
    override func makeNoise() -> String {
        "BRRRRR"
    }
    
    //Aunque ser haga override, hay que llamar al super
    override init(brand: String, model: String, owner: String, serialNumber: String, wheels: Int?) {
        isElectric = brand == "Toyota"
        super.init(brand: brand, model: model, owner: owner, serialNumber: serialNumber, wheels: wheels)
    }
    
    init(brand: String, model: String, serialNumber: String, isElectric: Bool) {
        self.isElectric = isElectric
        super.init(brand: brand, model: model, owner: "juan", serialNumber: serialNumber, wheels: 4)
        
    }
    
    convenience init(suzukiModel model: String, serialNumber: String, isElectric: Bool, boughtBy name: String){
        self.init(brand: "Suzuki", model: model, serialNumber: serialNumber, isElectric: isElectric)
        owner = name
    }
    
    override var brand: String{
        willSet(newMarca){//Capturamos el nuevo nombre
            print("My marca is \(newMarca)")
        }
        didSet {//Puedo o me deja acceder al valor anterior, una vez que cambie el valor nuevo con willSet
            print("My old marca was \(oldValue)") //Aqui no es necesario declarar oldValue
        }
        
    }

}

let myCar = Car(brand: "Ford", model: "2019", owner: "Brandon", serialNumber: "153653", wheels: 4)
myCar.isElectric
myCar.brand
myCar.makeNoise()
myCar.brand = "Ibiza"
//: [Next](@next)
