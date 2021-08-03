//
//  getHoroscope.swift
//  petProject
//
//  Created by Vlad Kozlov on 1.8.2021.
//

import Alamofire

func getHoroscope(sign: String, horoscopeObject: HoroscopeModel) {
    let url: String = "https://ohmanda.com/api/horoscope/\(sign.lowercased())"
    
    AF.request(url).responseJSON { response in
        if let parsed = try? response.result.get() {
            let parsedDictionary = parsed as! NSDictionary
            let horoscope = parsedDictionary.object(forKey: "horoscope") as! String
            RealmManager.shared.writeHoroscope(from: horoscope, model: horoscopeObject)
        }
    }
}
