//
//  birthData.swift
//  petProject
//
//  Created by Vlad Kozlov on 29.7.2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkManager {
    static let shared = NetworkManager()
    private init() {
    }
    
    var url = "https://byabbe.se/on-this-day/3/28/births.json"
    
    func getWikiBD(month: Int, day: Int, completion: @escaping (apiObject?) -> Void) {
        AF.request("https://byabbe.se/on-this-day/\(month)/\(day)/births.json").responseObject { (response: DataResponse<apiObject, AFError>) in
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
