import Foundation

class Vehicle {
    var isMoving : Bool = false
    func move(){
        isMoving = true
    }
    func stop(){
        isMoving = false
    }
    static func describe(){
        print("a vehicle!")
    }
    func makeNoise() -> String { "Noise" }
//var registration: (name: String, serialNumber: String, type: String)?{
        var brand: String
        let model: String
        var owner: String?
        let serialNumber: String
        let wheels: Int?
        
  init(brand: String, model: String, owner: String,serialNumber: String, wheels: Int){
            self.brand = brand
            self.model = model
            self.owner = owner
            self.serialNumber = serialNumber
            self.wheels = wheels
        }
        
        var type: String{
            return (wheels ?? 0) > 0 ? "land" : "other"
        }
        var registration: (name: String, serialNumber: String, type: String)?{
            get{
                if let owner = owner {
                    return (owner, serialNumber, type)
                }
                return nil
            }
            set(newRegistration){
                if let newRegistration = newRegistration{
                    owner = newRegistration.name
                }
            }
        }
    }
let vehiculo = Vehicle(brand : "", model: "ewdw", owner: "edweq", serialNumber: "38727hdhw", wheels: 4)
vehiculo.registration = (name: "Pau", serialNumber: "hewjew", type: "uehw")
vehiculo.move() //metodos de instancia
Vehicle.describe() // metodo de clase con static

class Car : Vehicle {
    override var type : String{ // sobreecritura de un string
        return "Car"
    }
    var isElectric: Bool
    init(electric: Bool){
        self.isElectric = electric // primero la clase actual despues la super
        super.init(brand: "Toyota", model: "some", owner: "some", serialNumber: "some", wheels: 4)
    }
    //solo puse makenoise y reconoce que ese metodo ya existe arriba lo
    // estamos sobreescribiendo
    override func makeNoise() -> String {"BRRM"}
    override init(brand: String, model: String, owner: String, serialNumber: String, wheels: Int) {
        isElectric = brand == "Toyota"
        super.init(brand: brand, model: model, owner: owner, serialNumber: serialNumber, wheels: 4)
    }
    convenience init(suzukiModel model: String, serialNumber: String,
                     isElectric: Bool, boughtBy name: String){
        self.init(brand: "some", model: "some", owner: "some", serialNumber: "some", wheels: 4)
            owner = name
    }
    
//    willSet(newName){
//        print("My new name is \(newName)")
//    }
//    didSet{ \\ aqui ya seria otro valor con el didset
//        print("My old name was \(oldValue)")
//    }
    override var brand: String{
        willSet(newmarca){
            print("Marca \(newmarca)")
            
        }didSet{
            print("Antes \(oldValue)")
        }
    }
}
let myCar = Car(electric: true)
myCar.isElectric
myCar.brand
myCar.makeNoise()
var carro = Car(brand: "Toyota", model: "some", owner: "some", serialNumber: "some", wheels: 4)
carro.brand = "Toyota2"
