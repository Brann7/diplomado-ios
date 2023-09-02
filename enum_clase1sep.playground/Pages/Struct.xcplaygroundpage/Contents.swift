//: [Previous](@previous)

import Foundation

//Struct no heredan
struct Dog {
    var isAdopted: Bool = true
    let color: String
    
    //Va a cachar el valor que llegue o el que le pasan
    var name: String{
        willSet(newName){//Capturamos el nuevo nombre
            print("My name is \(newName)")
        }
        didSet {//Puedo o me deja acceder al valor anterior, una vez que cambie el valor nuevo con willSet
            print("My old name was \(oldValue)") //Aqui no es necesario declarar oldValue
        }
        
    }
    
    static let amountOfPaws = 4
    var paws: Int = 4
    var specialNeeds: Bool {
        //sin return si es una linea (Self con 'S' mayus -> de qué tipo es y sobre ese tipo voy a obtener la propiedad o el método)
        paws != Self.amountOfPaws
    }
    
    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    
    //mutating: indicar que se va a modificar lo que hay de sí mismos, método de instancia
    mutating func changeName(newName: String) {
        name = newName
    }
    
    static func describeDog() -> String {
        "Dogs are really couter animals!"
    }
    
    init(name: String, isAdopted: Bool, color: String) {
        self.name = name
        self.isAdopted = isAdopted
        self.color = color
    }
    
    init(adopted name: String, color: String) {
        self.name = name
        self.isAdopted = true
        self.color = color
    }
    
    init(bought name: String, color: String) {
        //Toma el primer init de arriba
        self.init(name: name, isAdopted: false, color: color)
    }
    
    init() {
        self.init(adopted: "Milaneso", color: "Green")
    }
}

var anotherDog = Dog()//Init vacío en la linea 58

//No lleva let, sino var
var myDog = Dog(name: "Milaneso", isAdopted: true, color: "Brown")// SI lo pongo desde aqui el name, no pasa por la linea 11
myDog.isAdopted = false
myDog.name = "Dante" //Cuando lo cambio así, entonces ya pasa por la linea 11 y su bloque secuente
myDog.paws = 3
myDog.specialNeeds
print(myDog.getID())
myDog.changeName(newName: "Solovino")
//Acceder con static, para no crear una instancia
Dog.amountOfPaws
print(Dog.describeDog())

var yourDog = Dog(adopted: "Chilaquil", color: "yellow")
//: [Next](@next)
