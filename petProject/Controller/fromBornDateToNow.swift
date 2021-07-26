//
//  fromBornDateToNow.swift
//  petProject
//
//  Created by Vlad Kozlov on 25.7.2021.
//

import Foundation

func fromBornDateToNow(from: Date) -> String {
    let calendar = Calendar(identifier: .gregorian)
    let today = Date()
    let delta: DateComponents? = calendar.dateComponents([.year, .month, .day], from: from, to: today)
    
    var resultString: String = ""
    
    if let deltaChecked = delta {
        if (deltaChecked.year != 0) {
            resultString += String(deltaChecked.year!) + (deltaChecked.year! > 1 ? " years" : " year")
        }
        
        if (deltaChecked.month != 0) {
            resultString += ", " + String(deltaChecked.month!) + (deltaChecked.month! > 1 ? " months" : " month")
//            resultString += deltaChecked.month! > 1 ? "months" : "month"
        }
        
        if (deltaChecked.day != 0) {
            resultString += ", " + String(deltaChecked.day!) + (deltaChecked.day! > 1 ? " days" : " day")
        }
    }
    
    return resultString
}
