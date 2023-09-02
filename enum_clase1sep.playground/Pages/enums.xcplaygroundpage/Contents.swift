import UIKit

enum Pet: String {
    case dog = "🐶"
    case cat = "😼"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
    
    var type: String{
        switch self{ //Iteramos sobre nuestros propiso casos (case's)
            case .dog, .cat, .mouse: return "mamifero"
    case .turtle: return "reptile"
        case .parrot: return "ave"
        }
    }
    init?(name: String){
        switch name{
        case "dog": self.init(rawValue: "🐶")
        case "cat": self.init(rawValue: "😼")
        case "mouse": self.init(rawValue: "🐭")
        case "parrot": self.init(rawValue: "🦜")
        case "turtle": self.init(rawValue: "🐢")
        default: return nil
        }
    }
    
}

let myPet = Pet.dog.type
let myBird = Pet.parrot.type
let myReptile = Pet.turtle.type

let myDog = Pet(name: "mouse")
