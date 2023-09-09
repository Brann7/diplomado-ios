import UIKit

//Stack
//last in - first out
//push and pop

//struct Stack<Element> { //Element se utiliza solo en Struct
//    //var items = [Int]()
//    //Reemplamos Int por Element, trabajo con elementos
//    var items = [Element]()
//
//    mutating func push(_ newItem: Element){
//        items.append(newItem)
//    }
//
//    mutating func pop() -> Element?{
//        guard !items.isEmpty else { return nil }
//
//        return items.removeLast()
//    }
//}

var intStack: Stack<Int> = Stack()
intStack.push(1)
intStack.push(2)

//print(intStack.pop()) //! pongo para decir que sé que no es opcional
//print(intStack.pop())
//print(intStack.pop())

//var doubleStack: Stack<Double> = Stack()
//doubleStack.push(2.0)

//print(doubleStack.pop())
//print(doubleStack.pop())

//Los protocolos no pueden ser genericos
//implementacion del método Iterator de swift pero por nosotros
//protocol IterartorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}
//
protocol Sequence {
    associatedtype Iterarator: IteratorProtocol
    associatedtype Element where Element == Iterarator.Element

    func makeIterator() -> Iterarator
}

struct Stack<Element>: Sequence {
//    typealias Iterarator = StackIterator
//    typealias Element = StackIterator<Element>.Element
    //Element se utiliza solo en Struct
    //var items = [Int]()
    //Reemplamos Int por Element, trabajo con elementos
    var items = [Element]()
    
    mutating func push(_ newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element?{
        guard !items.isEmpty else { return nil }
        
        return items.removeLast()
    }
    
    func pushAll<S: Sequence>(_ sequence: S) where S.Element == Element{
        for item in sequence {
            self.push(item)
        }
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    func myMap<U>(_ transformer: (Element) -> (U)) -> Stack <U> {
        var result = [U]()
        for item in items {
            let transformedItem = transformer(item)
            result.append(transformedItem)
        }
        return Stack<U>(items: result)
    }
}

struct StackIterator<T>: IteratorProtocol {
    
    //typealias Element = T
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}



var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

for value in myStack {
    print("for in loop: got \(value)")
}

//for value

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print(value)
}

//-------------------------
var intStack2 = Stack<Int>()
intStack2.push(1)
intStack2.push(2)

//Equatable: incorpora todos los tipos que necesitan compararse con ==
func checkIfEqual<T: Equatable>(_ first: T,_ second: T) -> Bool {
    return first == second
}

//print(checkIfEqual("one", "one"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch((Int(1)), UInt(1)))
print(checkIfDescriptionsMatch((Int(1)), Double(1.0)))


//var doubledStack = intStack2.myMap( $0 * 2)

//Función para determinar el num. de palabras de cada elemento del array
//Func: T: type, U: sig. de T

//func myMap<T, U>(_ items: [T], _ transformer: (T) -> (U)) -> [U] {
//    var result = [U]()
//    for item in items {
//        let transformedItem = transformer(item)
//        result.append(transformedItem)
//    }
//    return result
//}
//-----------------
let myStrings = ["one", "two", "three"]
//SI el closure es el ultimo parametro, se puede encerrar entre ()
//let stringsLengths = myMap(myStrings) { $0.count}
//print(stringsLengths)
