//
//  CreateAcronym.swift
//  
//
//  Created by Mohammed Elnaggar on 9/13/20.
//

import Fluent

struct CreateAcronym: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Acronym.schema)
            .id()
            .field(Acronym.FieldKeys.short, .string, .required) .field(Acronym.FieldKeys.long, .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Acronym.schema).delete()
    }
}
