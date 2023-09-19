//: [Previous](@previous)

import Foundation

var steps = 0
print("Posición en tablero: \(steps)")
while steps < 24 {
    let dado = Int.random(in: 1...6)
    print("----------------------------------")
    print("Lanzamineto dado: \(dado)")
    steps += dado
    print("Posición en tablero: \(steps)")
    
    if steps == 2  { //Escaleras
        steps += 8
        print("Sube escaleras de \(steps-8) a \(steps)")
    }
    if steps == 5 {//Escaleras
        steps += 11
        print("Sube escaleras de \(steps-11) a \(steps)")
    }
    if steps == 8 {//Escaleras
        steps += 9
        print("Sube escaleras de \(steps-9) a \(steps)")
    }
    if steps == 9 {//Escaleras
        steps += 2
        print("Sube escaleras de \(steps-2) a \(steps)")
    }
    if steps == 13 {//serpientes
        steps -= 10
        print("Serpiente, baja de \(steps+10) a \(steps)")
    }
    if steps == 18 {//serpientes
        steps -= 11
        print("Serpiente, baja de \(steps+11) a \(steps)")
    }
    if steps == 21 {//serpientes
        steps -= 11
        print("Serpiente, baja de \(steps+11) a \(steps)")
    }
    if steps == 23 {//serpientes
        steps -= 8
        print("Serpiente, baja de \(steps+8) a \(steps)")
    }
    if steps >= 24 {//serpientes
        //print("Posición: \(steps)")
        print("Win!")
    }
}

//: [Next](@next)
