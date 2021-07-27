//
//  RegExp.swift
//  petProject
//
//  Created by Vlad Kozlov on 22.7.2021.
//

import Foundation
import SwiftCSV


// starts here
func readFile() throws -> CSV {
    var data: CSV? = .none
    
    do {
        data = try CSV(
                name: "33837",
                extension: "csv",
                bundle: .main,
                delimiter: "\t",
                encoding: .utf8)
    } catch {
        throw CSVParseError.generic(message: "error with data")
    }
    
    // pass to dataToHistoryWeatherDict
    return data!
}

//// returns main result as Dictionary
//func dataToHistoryWeatherDict(data: CSV) throws -> [String : [Float]] {
//    var lexemDict = Array<[String]>()
//    var historyWeatherDict = Dictionary<String, [Float]>()
//
//    do {
//        try data.enumerateAsArray{ dataStringArray in
//            for item in dataStringArray {
//                let lexem = item.split(separator: ",")
//                var stringLexem = Array<String>()
//                for item in lexem {
//                    stringLexem.append(String(item))
//                }
//                lexemDict.append(stringLexem)
//            }
//        }
//        for element in lexemDict {
//            historyWeatherDict[element[0]] = valuesToDict(element)
//        }
//    } catch {
//        throw CSVParseError.generic(message: "error with enumeration")
//    }
//
//    return historyWeatherDict
//}
//
//// used in dataToHistoryWeatherDict
//func valuesToDict(_ array: [String]) -> [Float] {
//    var toReturn = [Float]()
//
//    for item in 1..<array.count {
//        toReturn.append(Float(array[item])!)
//    }
//
//    return toReturn
//}
