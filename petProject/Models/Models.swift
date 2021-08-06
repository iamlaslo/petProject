//
//  model.swift
//  petProject
//
//  Created by Vlad Kozlov on 31.7.2021.
//

import Foundation
import RealmSwift
import ObjectMapper
//import ObjectMapper_Realm

class wikiModel: Object, Mappable {

    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted dynamic var births: List<BirthsModel>
    @Persisted dynamic var wikipedia: String = ""
    @Persisted dynamic var date: String = ""

    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }

    func mapping(map: ObjectMapper.Map) {
        births <- map["births"]
        wikipedia <- map["wikipedia"]
        date <- map["date"]
    }
}

class BirthsModel: Object, Mappable {

//    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted dynamic var wikipedia: WikipediaModel? = WikipediaModel()
    @Persisted dynamic var year: String = ""
    @Persisted dynamic var name: String = ""

    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
            return "name"
          }

    func mapping(map: ObjectMapper.Map) {
        wikipedia <- map["wikipedia"]
        year <- map["year"]
        name <- map["description"]
    }
}

class WikipediaModel: Object, Mappable {

    @Persisted dynamic var wikipedia: String = ""
    @Persisted dynamic var title: String = ""

    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }

    func mapping(map: ObjectMapper.Map) {
        wikipedia <- map["wikipedia"]
        title <- map["title"]
    }
}
