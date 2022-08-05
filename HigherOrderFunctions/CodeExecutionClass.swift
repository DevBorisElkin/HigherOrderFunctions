//
//  CodeExecutionClass.swift
//  HigherOrderFunctions
//
//  Created by test on 05.08.2022.
//

import Foundation

class CodeExecutionClass {
    
    static func filterExample(){
        print(#function)
        
        var items = [1, 2, 12, 14, 15, 19, 21, 22, 23, 28, 5, 42, 123, 226, 7, 2229, 12332]
        print("Before: \(items)")
        // long example
//        items = items.filter({ number in
//            number % 2 == 0
//        })
        
        // short example
        items = items.filter({ $0.isMultiple(of: 2) })
        
        print("After: \(items)")
    }
    
    // MARK: ANOTHER EXAMPLE WOULD BE IS THAT YOU CAN FILTER PEOPLE BY FIRST LETTER IN THEIR NAME, FOR EXAMPLE, SHOW THE ONLY PEOPLE WHO'S NAME STARTS WITH 'P' LETTER
    static func filterDetailedExample(){
        print(#function)
        
        var individuals = [Person(name: "John", age: 13, sex: .Male),
                           Person(name: "kate", age: 22, sex: .Female),
                           Person(name: "Sarah", age: 35, sex: .Female),
                           Person(name: "Peter", age: 55, sex: .Male),
                           Person(name: "Bob", age: 6, sex: .Male),
                           Person(name: "Arnold", age: 18, sex: .Male)]
        print("Initial list of individuals: \(individuals)")
        
        var alcoholEligible = individuals.filter({ $0.age >= 18 })
        
        print("Able to buy alcohol: \(alcoholEligible)")
    }
    
    static func mapExample(){
        print(#function)
        
        var items = [1, 2, 12, 14, 15, 19, 21, 22, 23, 28, 5, 42, 123, 226, 7, 2229, 12332]
        print("Before: \(items)")
//        items = items.map({ number in
//            number * 2
//        })
        items = items.map({ $0 * 2 })
        
        print("After: \(items)")
    }
    
    // MARK: DON'T FORGET THAT WITH 'MAP' YOU CAN EXTRACT A SINGLE VARIABLE AND PUT IT INTO AN ARRAY, FOR EXAMPLE, ONLY NAMES OF PEOPLE, OR PUT INTO TUPLE (NAME, AGE) 2 VALUES AND ETC.
    static func mapDetailedExample(){
        print(#function)
        
        var individuals = [Person(name: "John", age: 13, sex: .Male),
                           Person(name: "kate", age: 22, sex: .Female),
                           Person(name: "Sarah", age: 35, sex: .Female),
                           Person(name: "Peter", age: 55, sex: .Male),
                           Person(name: "Bob", age: 6, sex: .Male),
                           Person(name: "Arnold", age: 18, sex: .Male)]
        print("Initial list of individuals: \(individuals)")
        
        var peoplesArray = individuals.map { individual in
            Human(name: individual.name, age: individual.age, sex: individual.sex, workExperience: individual.age > 18 ? individual.age - 18 : 0, job: "None")
        }
        
        print("Mapped people: \(peoplesArray)")
    }
    
    static func reduceExample(){
        print(#function)
        
        var items = [1, 2, 12, 14, 15, 19, 21, 22, 23, 28, 5, 42, 123, 226, 7, 2229, 12332]
        print("Before: \(items)")
        var result = items.reduce(into: 0) { partialResult, item in
            partialResult += item
        }
        
        print("After: \(items)")
        print("Result: \(result)")
    }
    
    static func reduceDetailedExample(){
        print(#function)
        
        var individuals = [Person(name: "John", age: 13, sex: .Male),
                           Person(name: "kate", age: 22, sex: .Female),
                           Person(name: "Sarah", age: 35, sex: .Female),
                           Person(name: "Peter", age: 55, sex: .Male),
                           Person(name: "Bob", age: 6, sex: .Male),
                           Person(name: "Arnold", age: 18, sex: .Male)]
        print("Initial list of individuals: \(individuals)")
        
        var combinedWorkExperience = individuals.reduce(into: 0) { partialResult, individual in
//            partialResult += individual.age > 18 ? individual.age - 18 : 0
            var personWorkExperience: Int = individual.age > 18 ? individual.age - 18 : 0
            print("Person \(individual.name) work experience: \(personWorkExperience)")
            partialResult += personWorkExperience
        }
        
        print("combinedWorkExperience: \(combinedWorkExperience)")
    }
}
