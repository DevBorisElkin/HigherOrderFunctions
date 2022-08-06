//
//  CodeExecutionClass.swift
//  HigherOrderFunctions
//
//  Created by test on 05.08.2022.
//

import Foundation

class CodeExecutionClass {
    
    // MARK: ALL TESTED HIGHER ORDER FUNCTIONS:
    // MARK: Filter, Map, Reduce, ForEach, CompactMap, FlatMap, Sort, Sorted, Contains, RemoveAll, First
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
    
    static func mapDictionary(){
        print(#function)
        
        
        var temperaturesInCelcius = ["New York":12,
                           "San Francisco":23,
                           "San Antonio":26,
                           "Baltimor":6]
        print("temperatures in Celcius: \(temperaturesInCelcius)")
        
        // short way into array of dictionaries
        var temperaturesInFarenheits = temperaturesInCelcius.map { [$0:$1 * 9 / 5 + 32] }
        print("temperatures in Farenheits: \(temperaturesInFarenheits)")
    }
    static func mapSet(){
        print(#function)
        
        
        var temperaturesInCelcius: Set = [12,32,5,52,32,-8]
        print("temperatures in Celcius: \(temperaturesInCelcius)")
        
        // array of ints
        //var temperaturesInFarenheits = temperaturesInCelcius.map { $0 * 9 / 5 + 32 }
        // set of ints
        var temperaturesInFarenheits = Set(temperaturesInCelcius.map { $0 * 9 / 5 + 32 })
        print("temperatures in Farenheits: \(temperaturesInFarenheits)")
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
    
    // MARK: FOR-EACH EXAMPLE
    static func forEachExample(){
        print(#function)
        var temperaturesInCelcius = ["New York":12,
                           "San Francisco":23,
                           "San Antonio":26,
                           "Baltimor":6]
        print("temperatures in Celcius: \(temperaturesInCelcius)")
        
        var temperaturesInFarenheits = [String: Int]()
        temperaturesInCelcius.forEach { temperaturesInFarenheits[$0] = $1 * 9 / 5 + 32 }
        
        print("temperatures in Farenheits: \(temperaturesInFarenheits)")
    }
    
    // https://stackoverflow.com/questions/49291057/difference-between-flatmap-and-compactmap-in-swift#:~:text=With%20flatMap%20you%20can%20transform,any%20items%20that%20were%20nil.&text=compactMap%20is%20doing%20the%20same%20thing.
    
    // In short, use compactMap() to get rid of optionals, and flatMap() to beak down elements into the smaller ones, like [[Int]] into [Int], or String into [Char]
    
    // make conversion without optionals - when conversion with regular map function could have produced nil values
    // Note that compactMap() and flatMap() both remove optionals
    static func compactMapExample(){
        print(#function)
        var stringIntegers = ["1", "2", "three", "error", "5", "13"]
        print("stringIntegers: \(stringIntegers)")
        
        //var integers = stringIntegers.map({ Int($0) })
        var integers = stringIntegers.compactMap({ Int($0) })
        
        print("integers: \(integers)")
    }
    
//    static func compactMapSecondExample(){
//        print(#function)
//        var someIntegers = [[1,2,14], [2,12,11,333], [2], [2,33]]
//        print("someIntegers: \(someIntegers)")
//
//        //var integers = stringIntegers.map({ Int($0) })
//        var integers = someIntegers.compactMap({ $0 }) // doesn't work
//        var integers = someIntegers.flatMap({ $0 })
//
//        print("integers: \(integers)")
//    }
    
    // convers array of arrays of ints into single array
    // also removes optionals
    static func flatMapExample(){
        print(#function)
        
        // simple example, breaks into individual elements
        //var stringIntegers = [[2,3],[1],[6,13,24],[1,23,53]]
        
        // doesn't work
//        var stringIntegers = [[2,3, Int("15")],[1],[6,13,24, Int("Hello")],[1,23,53, nil, nil, 777, Int("665")]]
        
        var stringIntegers = [[2,3],[1], nil, nil, [6,13,24],nil, [1,23,53, 777]]
        print("stringIntegers: \(stringIntegers)")
        
        //var integers = stringIntegers.map({ Int($0) })
        var integers = stringIntegers.flatMap({ $0 }).flatMap({ $0 })
        
        print("integers: \(integers)")
    }
    
    // sort - changes the initial array
    // sorted - copies array and returns sorted version of it
    // https://stackoverflow.com/questions/40621076/whats-the-difference-between-sorted-and-sort-in-array
    static func sortSortedExample(){
        print(#function)
        var integers = [4, 2, 12, 1, 15, 10, 21, 20, 14, 28, 5, 42, 123, 226, 7, 2229, 12332, 77]
        print("integers -> initial: \(integers)")
        
        // ascending sort
        integers.sort { $0 < $1 }
        
        print("integers.sort(): \(integers)")
        
        var strings = ["Hello", "There", "By", "Very Long String", "Kinof cool", "K", "KKK"]
        print("strings: \(strings)")
        
        strings.sort { lhs, rhs in
            lhs.count < rhs.count
        }
        
        print("String.sort(): \(strings)")
        
        var otherStringsArray = strings.sorted { lhs, rhs in
            lhs.count > rhs.count
        }
        
        print("otherStringsArray: \(otherStringsArray)")
    }
    
    static func sortSortedDetailedExample(){
        print(#function)
        var individuals = [Person(name: "John", age: 13, sex: .Male),
                           Person(name: "kate", age: 22, sex: .Female),
                           Person(name: "Sarah", age: 35, sex: .Female),
                           Person(name: "Peter", age: 55, sex: .Male),
                           Person(name: "Bob", age: 6, sex: .Male),
                           Person(name: "Arnold", age: 18, sex: .Male)]
        print("Initial list of individuals: \(individuals)")
        
        //var individualsSortedByWorkExperience = individuals.sorted { lhs, rhs in
        //    var lhsWorkExp: Int = lhs.age > 18 ? lhs.age - 18 : 0
        //    var rhsWorkExp: Int = rhs.age > 18 ? rhs.age - 18 : 0
        //
        //    return lhsWorkExp < rhsWorkExp
        //}
        
        var individualsSortedByWorkExperience = individuals.sorted(by: { lhs, rhs in
            return lhs.workExp() < rhs.workExp()
        })
        
        print("Individuals by work experience: \(individualsSortedByWorkExperience)")
    }
    
    static func miscTests(){
        print(#function)
        
        var individuals = [Person(name: "John", age: 13, sex: .Male),
                           Person(name: "kate", age: 22, sex: .Female),
                           Person(name: "Sarah", age: 35, sex: .Female),
                           Person(name: "Peter", age: 55, sex: .Male),
                           Person(name: "Bob", age: 6, sex: .Male),
                           Person(name: "Arnold", age: 18, sex: .Male)]
        
        var hasAnAdult = individuals.contains { person in
            person.isAdult()
        }
        
        individuals.removeAll { person in
            !person.isAdult()
        }
        
        var optionalIndividuals: [Person?] = individuals
        
        var fistIndividualWithSufficientWorkExperience = individuals.first { person in
            person.workExp() > 5
        }
        
        
        
        print("All adults: \(individuals)")
        
        print("At least one of people is adult: \(hasAnAdult)")
        
    }
    
}
