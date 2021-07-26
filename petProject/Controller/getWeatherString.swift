//
//  getWeatherString.swift
//  petProject
//
//  Created by Vlad Kozlov on 26.7.2021.
//

import Foundation

func getWeatherString(date: Date) -> String {
    
    guard let weatherArray: [Float] = try? getWeatherArray(date: date) else {
        return "error"
    }
    
    let weatherAverageTemp: Int = Int(weatherArray[0]) // to avoid floating temp
    let weatherPrecipations: Float = weatherArray[3]
    let weatherCondition: String = weatherPrecipations == 0 ? "Clear" : "Precipations"
    
    let weatherString: String = "\(weatherCondition), with average \(weatherAverageTemp)°C"
    
    return weatherString
}
