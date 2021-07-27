//
//  getWikiData.swift
//  petProject
//
//  Created by Vlad Kozlov on 27.7.2021.
//

import Foundation
import Alamofire

func getWikiData() {
    let url = "https://en.wikipedia.org/w/api.php"
    let TITLE = "Wikipedia:Unusual_articles/Places_and_infrastructure"
    let param = ["action": "parse",
                 "page": TITLE,
                 "prop": "wikitext",
                 "section": 5,
                 "format": "json"] as [String : Any]
    
    let data = AF.request(url, method: .get, parameters: param).responseString { str in
        print(str)
    }
}
