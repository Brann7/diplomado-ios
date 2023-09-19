//: [Previous](@previous)

import Foundation

//Ejercicio plano cartesiano

var coordenadas = (1, 3)

switch coordenadas{
case (0, 0):
    print("Valor en el origen")
case (1...5, 1...5):
    print("Cuadrante 1")
case (-5 ... -1, 1...5):
    print("Cuadrante 2")
case (-5 ... -1, -5 ... -1):
    print("Cuadrante 3")
case (1...5, -5 ... -1):
    print("Cuadrante 4")
case (_, 0):
    print("Valor en el eje X")
    case (0, _):
        print("Valor en el eje Y")

default: print("Fuera del plano")
}

//: [Next](@next)
