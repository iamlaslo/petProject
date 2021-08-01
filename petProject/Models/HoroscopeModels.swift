//
//  HoroscopeModels.swift
//  petProject
//
//  Created by Vlad Kozlov on 1.8.2021.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class SignModel: Object, Codable {
//    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var sign: String = ""
    @Persisted var id: Int = 0
    override static func primaryKey() -> String? {
        return "id"
    }
}





