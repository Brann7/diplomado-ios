// temas de estructuras y clases


//: [Previous](@previous)

//import Foundation
//struct Dog{
//    var isAdopted: Bool = true
//    let color: String
//    var name: String{
//        willSet(newName){
//            print("My new name is \(newName)")
//        }
//        didSet{ \\ aqui ya seria otro valor con el didset
//            print("My old name was \(oldValue)")
//        }
//    }
//}
//var myDog = Dog(color: "Brown", name: "Milaneso")
//myDog.isAdopted = false
//myDog.name = "Dante"

import Foundation
struct Dog{
    static func describeADog
    static let amountOfPaws = 4
    var paws: Int = 4
    var specialNeeds: Bool{
        paws != Self.amountOfPaws
    }
    func getID() -> String{
        return name + "\n" + "color: \(color)" + "\n" + "paws" + "\(paws)"
    }
    var isAdopted: Bool = true
    let color: String
    var name: String{
        willSet(newName){
            print("My new name is \(newName)")
        }
        didSet{ // aqui ya seria otro valor con el didset
            print("My old name was \(oldValue)")
        }
        init(strName: String, isAdopted: Bool, color: String){
            self.isAdopted = isAdopted
            self.color = color
        }
    }
}
var myDog = Dog(color: "Brown", name: "Milaneso")
myDog.isAdopted = false
myDog.name = "Dante"
myDog.specialNeeds
myDog.getID()
var myDog = Dog(name: "Milaneso", isAdopted: true, color: "Brown")
myDog.isAdopted = false




