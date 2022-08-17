//
//  WorkingWithOptional.swift
//  HigherOrderFunctions
//
//  Created by test on 17.08.2022.
//

import Foundation

class WorkingWithOptional {
    static func workingWithOptional() {
        var person: Person? = Person(name: "Bob", age: 24, sex: .Male)
        //person = nil
        
        switch person {
        case .none:
            print("person == nil")
        case .some(let value):
            print("person is not nil")
            print(value.name)
        }
        
        print("_____")
        //var personNotNil: Person!
        if person == nil && person == .none {
            print("person == nil // and person == .none")
        } else if person != nil && person != .none {
            let anotherPerson: Person = Optional.some(person!).unsafelyUnwrapped
            print("person != nil and person != .none -> \(anotherPerson.name)")
        }
    }
}

