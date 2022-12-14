//
//  Person.swift
//  HigherOrderFunctions
//
//  Created by test on 05.08.2022.
//

import Foundation

enum Sex {
    case Male, Female
}

struct Person: Hashable {
    var name: String
    var age: Int
    var sex: Sex
    
    func workExp() -> Int {
        return age > 18 ? age - 18 : 0
    }
    
    func isAdult() -> Bool {
        return age >= 18
    }
}
