//
//  birthData.swift
//  petProject
//
//  Created by Vlad Kozlov on 29.7.2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift
import ObjectMapper_Realm


class NetworkManager {
    static let shared = NetworkManager()
    private init() {
    }
    
    var url = "https://byabbe.se/on-this-day/3/28/births.json"
    
    func getWikiBD(bornDate: String, completion: @escaping (wikiObject?) -> Void) {
        AF.request("https://byabbe.se/on-this-day/\(bornDate)/births.json").responseObject { (response: DataResponse<wikiObject, AFError>) in
            if response.error == nil {
                do {
                    let obj = try response.result.get()
                    completion(obj)
                } catch {
                    completion(nil)
                }
            }
            else {
                completion(nil)
            }
        }
    }
}
