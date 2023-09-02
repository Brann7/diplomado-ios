import UIKit
//Closure: Bloque de codigo que nos permite programar una funcionalidad en nuestro programa (Función que no tiene nombre)

//Closures
let volunteerCounts = [1,3,40,32,2,53,77,13]
let volunteerAverages: [Double] = [10.75,4.2,1.5,12.12,16.815] //Con la func lo vamos a redondear

//map: itera cada uno de los elementos y le hace una operación y nos regresa los datos ya operados
//Va por cada elemento, toma el numero, lo pasa al closure, lo redondea y lo regresa de tipo string y regresa una coleccion del mismo tamaño
//let roundedVolunteers = volunteerAverages.map { number in let roundedNumber = Int(number)
//    return "\(roundedNumber)"
//}
let roundedVolunteers = volunteerAverages.map { number in
    return Int(number)
}
print("map: \(roundedVolunteers)")

//Filter
//Si es true lo agrega al arreglo, si es false, no lo agrega
let passingVolunteers = roundedVolunteers.filter {number in return number >= 10}
print(passingVolunteers)

//reduce

//Le pasamos el valor inicial en partialresult y después el siguiente numero y se guarda en partialresult y se suma con el siguiente numero, asi sucesivamente
let totalVolunteers = passingVolunteers.reduce(0){
    partialResult, number in return partialResult + number
}
print(totalVolunteers)

//valor inical, closure
let finalVolunteersDescription = passingVolunteers.reduce("The volunteers were") {
    partialResult, number in return partialResult + " \(number) "
}
print(finalVolunteersDescription)
//func format(numbers: [Double], using formatter: (Double) -> String) -> [String]{
//    var result = [String]()
//
//    for number in numbers {
//        let tranformedNumber = formatter(number)
//        result.append(tranformedNumber)
//    }
//
//    return result
//}
//
//func rounder(_ number: Double) -> String {
//    let roundedNumber: Int = Int(number)
//    return "\(roundedNumber)"
//}
//
//func addDescription(_ number: Double) -> String {
//    return "Volunteer average: \(number)"
//}
//let averageVolunteerDescription = format(numbers: volunteerAverages, using: rounder)
//print(averageVolunteerDescription)
//
//
//
//let formatterAverageVolunteers = format(numbers: volunteerAverages, using: rounder)
//print(formatterAverageVolunteers)

//func isAscending(_ i: Int, _ j: Int) -> Bool{
//    return i < j
//}

//let volunteerSorted = volunteerCounts.sorted(by: isAscending)

//Dentro { } opta que i y j son enteros y verifica si i es menor que j
//let volunteerSorted = volunteerCounts.sorted(by: { (i: Int, j: Int) in i < j})

// $0 hace referencia al primer parametro y $1 al segundo parametro
//let volunteerSorted = volunteerCounts.sorted(by: { $0 < $1})

//Aún más reducido
//let volunteerSorted = volunteerCounts.sorted { $0 < $1}
//print(volunteerSorted)


//Funcion que no recibe parametros y no regresa nada
//func doAwsomeWork(on input: String, using transformer: () -> Void, then completion: () -> Void){
//    //Here would go the logic to do the awesome work
//}
//
////doAwsomeWork(on: "Diplomado", using: {}, then: {})
//
//doAwsomeWork(on: "Diplomado"){
//    //Here goes the transformer
//}then: {//Aquí podemos poner el clouser que queremos pasar
//    //Here goes the completion
//}


