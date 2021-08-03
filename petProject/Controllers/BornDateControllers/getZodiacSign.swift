//
//  getZodiacSign.swift
//  petProject
//
//  Created by Vlad Kozlov on 1.8.2021.
//

import Alamofire

typealias CompletionHandler = (_ success: Bool) -> Void

func getZodiacSign(date: Date, signObject: SignModel, completionHandler: @escaping CompletionHandler) -> Void {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.dateFormat = "YYYY-MM-dd"
    let dateAsString = dateFormatter.string(from: date)
    
    var flag: Bool?
    
    let urlString: String = "https://zodiac-sign.p.rapidapi.com/sign?date=\(dateAsString)"
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "25cc996b6fmshdf30acf4803d931p1e2482jsnb94593ea5cbc",
        "x-rapidapi-host": "zodiac-sign.p.rapidapi.com"
    ]
    
    AF.request(urlString, headers: headers).responseString { response in
        if let sign = try? response.result.get() {
            RealmManager.shared.writeSignToRealm(from: sign, model: signObject)
            flag = true
            completionHandler(flag!)
        }
    }
}
