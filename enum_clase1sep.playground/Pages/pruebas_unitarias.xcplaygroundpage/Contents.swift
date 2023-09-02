//: [Previous](@previous)

import XCTest //Librería de pruebas

class MyTests: XCTestCase {
    
    func getFullName(_ nameTuple: (String, String?, String, String?)) -> String{
        return nameTuple.0 + " " + (nameTuple.1 ?? "") + " " + nameTuple.2 + " " + (nameTuple.3 ?? "")
//        return nameTuple.0 + " " + (nameTuple.1 ?? "") + " " + nameTuple.2 + " " + (nameTuple.3 ?? "")
        
    }
    
    //Sintaxis: En forma de funcion, sin parametros, no regresa nada
    func test_GetFullName() {
        //Given
        let firstPerson: (String, String?, String, String?) = (first: "Brandon", second: "Bran", lastname: "Luna", secondLastName: "Pérez")
        
        let secondPerson: (String, String?, String, String?) = (first: "Manuel", second: nil, lastname: "Perez", secondLastName: nil)
        
        //when: se pone el proceso (caja negra)
        let firstFullName = getFullName(firstPerson)
        let secondFullName = getFullName(secondPerson)
        
        //then
        XCTAssertEqual(firstFullName, "Brandon Bran Luna Pérez")
        XCTAssertEqual(secondFullName, "Manuel Perez")
    }
}

MyTests.defaultTestSuite.run()

//: [Next](@next)
