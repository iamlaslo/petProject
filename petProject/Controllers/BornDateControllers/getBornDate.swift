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
    let bornDate = date
    
    return bornDate
}
