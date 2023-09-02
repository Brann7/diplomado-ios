import UIKit

var greeting = "Hello, playground"
enum Pet:String{
    case dog = "dog"
    case cat = "cat"
    case mouse = "mouse"
    case parrot = "pajaro"
    case turtle = "tortuga"
    
}
enum Pet: String {
    var type: String{
        switch self{
        case .dog, .cat, .mouse : return "mamifero"
        case .turtle : return "reptil"
        case .parrot: return "pajaro"
        }
    }
}

