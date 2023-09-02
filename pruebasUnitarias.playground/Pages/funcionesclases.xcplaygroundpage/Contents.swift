//: [Previous](@previous)
import XCTest

class MyTests: XCTestCase {
    func getFullName(_ nameTuple: (String?, String?, String?, String?)) -> String {
            let firstName = nameTuple.0 ?? ""
            let secondName = nameTuple.1 != nil ? " " + nameTuple.1! : ""
            let firstLastName = nameTuple.2 != nil ? " " + nameTuple.2! : ""
            let secondLastName = nameTuple.3 != nil ? " " + nameTuple.3! : ""
            
            return firstName + secondName + firstLastName + secondLastName
}
        
        func test_DefaultName() {
            // Given
            let firstPerson: (String?, String?, String?, String?) = ("Brandon", "Bran", "Luna", "Pérez")
            let secondPerson: (String?, String?, String?, String?) = ("Manuel", nil, "Perez", nil)
            
            // When
            let firstFullName = getFullName(firstPerson)
            let secondFullName = getFullName(secondPerson)
            
            // Then
            XCTAssertEqual(firstFullName, "Brandon Bran Luna Pérez")
            XCTAssertEqual(secondFullName, "Manuel Perez")
        }
    }
    
    MyTests.defaultTestSuite.run()

