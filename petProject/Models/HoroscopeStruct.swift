//
//  HoroscopeStruct.swift
//  petProject
//
//  Created by Vlad Kozlov on 1.8.2021.
//

import Foundation
import ObjectMapper

struct HoroscopeStruct: Mappable {
    var sign : String?
    var date : String?
    var horoscope : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        sign <- map["sign"]
        date <- map["date"]
        horoscope <- map["horoscope"]
    }

}
