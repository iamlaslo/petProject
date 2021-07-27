//
//  getBornDate.swift
//  petProject
//
//  Created by Vlad Kozlov on 25.7.2021.
//

import Foundation

func getBornDate(date: Date) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-mm-dd"
    
//    guard let bornDate = dateFormatter.date(from: date) else {
//        print("can't get born date")
//        return Date()
//    }
    
    let bornDate = date
    
    return bornDate
}
