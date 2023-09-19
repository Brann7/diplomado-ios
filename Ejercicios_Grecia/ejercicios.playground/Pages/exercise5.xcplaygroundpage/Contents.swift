//: [Previous](@previous)

import Foundation

//6+((4*(8-1))/2)

enum ArithmeticExpresion {
    case number(Int)
    //Agregar indirect cuando sumamos expresiones dentro de parentesis, etc
    indirect case addition(ArithmeticExpresion, ArithmeticExpresion)
    indirect case multiplication (ArithmeticExpresion, ArithmeticExpresion)
    indirect case division (ArithmeticExpresion, ArithmeticExpresion)
    indirect case resta (ArithmeticExpresion, ArithmeticExpresion)
}

let five = ArithmeticExpresion.number(5)
let two = ArithmeticExpresion.number(2)
let four = ArithmeticExpresion.number(4)
let six = ArithmeticExpresion.number(6)
let eight = ArithmeticExpresion.number(8)
let one = ArithmeticExpresion.number(1)


let resta = ArithmeticExpresion.resta(eight, one)
let product = ArithmeticExpresion.multiplication(four, resta)
let division = ArithmeticExpresion.division(product,two)
let suma = ArithmeticExpresion.addition(six, division)

func evaluate(expression: ArithmeticExpresion) -> Int {
    switch expression {
    case .number(let number): return number
    case .addition(let leftExp, let rightExp): return evaluate(expression: leftExp) + evaluate(expression: rightExp)
    case .multiplication(let leftExp, let rightExp): return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    case .division(let leftExp, let rightExp): return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    case .resta(let leftExp, let rightExp): return evaluate(expression: leftExp) - evaluate(expression: rightExp)
    }
}

//6+((4*(8-1))/2)


print(evaluate(expression: suma))

//: [Next](@next)
