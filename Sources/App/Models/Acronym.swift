//
//  Acronym.swift
//  
//
//  Created by Mohammed Elnaggar on 9/13/20.
//

import Vapor
import Fluent

final class Acronym: Model {
    
    static let schema = "acronyms"
    
    struct FieldKeys {
        static var short: FieldKey { "short" }
        static var long: FieldKey { "long" }
    }
    
    @ID
    var id: UUID?
    
    @Field(key: FieldKeys.short)
    var short: String
    @Field(key: FieldKeys.long)
    var long: String
    
    init() {}
    
    init(id: UUID? = nil, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
    
}

extension Acronym: Content {}
