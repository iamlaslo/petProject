//
//  getWeather.swift
//  petProject
//
//  Created by Vlad Kozlov on 26.7.2021.
//

import Foundation

func getWeatherArray(date: Date) -> [Float] {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    
    guard let weatherDict = try? dataToHistoryWeatherDict(data: loadFromGithub()) else {
        return []
    }
    
    let bornDateAsDate = getBornDate(date: date)
    print(bornDateAsDate)
    let bornDate = dateFormatter.string(from: bornDateAsDate)
    print(bornDate)
    
    guard let weatherAtBirthday = weatherDict[bornDate] else {
        return []
    }
    
    return weatherAtBirthday
}


