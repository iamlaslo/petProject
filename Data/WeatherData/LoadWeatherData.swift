//
//  LoadWeatherData.swift
//  petProject
//
//  Created by Vlad Kozlov on 27.7.2021.
//

import Foundation
import SwiftCSV

// loading data from github as csv that would need to be converted to dictionary
func loadFromGithub() throws -> CSV {
    let url = URL(string: "https://raw.githubusercontent.com/yavladikku/Meteostat/main/33837.csv")
    let dataCSV: CSV?
    
    do {
        dataCSV = try CSV(url: url!, delimiter: "\t", encoding: .utf8, loadColumns: false)
    } catch {
        throw CSVParseError.generic(message: "csv error")
    }
    
    guard let data = dataCSV else {
        print("can't unwrap csv data")
        throw CSVParseError.generic(message: "csv error")
    }
    
    return data
}

// returns main result as Dictionary
func dataToHistoryWeatherDict(data: CSV) throws -> [String : [Float]] {
    var lexemDict = Array<[String]>()
    var historyWeatherDict = Dictionary<String, [Float]>()
    
    do {
        try data.enumerateAsArray{ dataStringArray in
            for item in dataStringArray {
                let lexem = item.split(separator: ",")
                var stringLexem = Array<String>()
                for item in lexem {
                    stringLexem.append(String(item))
                }
                lexemDict.append(stringLexem)
            }
        }
        for element in lexemDict {
            historyWeatherDict[element[0]] = valuesToDict(element)
        }
    } catch {
        throw CSVParseError.generic(message: "error with enumeration")
    }
    
    return historyWeatherDict
}

// used in dataToHistoryWeatherDict
func valuesToDict(_ array: [String]) -> [Float] {
    var toReturn = [Float]()

    for item in 1..<array.count {
        toReturn.append(Float(array[item])!)
    }

    return toReturn
}
