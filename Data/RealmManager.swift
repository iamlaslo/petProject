////
////  RealmManager.swift
////  petProject
////
////  Created by Vlad Kozlov on 31.7.2021.
////
//
//import Foundation
//import RealmSwift
//
//extension Realm {
//    public func safeWrite(_ block: (() throws -> Void)) throws {
//        if isInWriteTransaction {
//            try block()
//        } else {
//            try write(block)
//        }
//    }
//}
//
//class RealmManager {
//    static let shared = RealmManager()
//    
//    private let realm: Realm!
//    
//    private init() {
//        realm = try! Realm(configuration: config)
//        print("RealmURL: ", realm.configuration.fileURL as Any)
//    }
//    
//    var config = Realm.Configuration.defaultConfiguration
//    
//    func getWikiModels() -> [Root] {
//        let res = realm.objects(Root.self)
//        var retArray: Array = Array<Root>()
//        for model in res {
//            retArray.append(model)
//        }
//        return retArray
//    }
//    
//    func saveWikiModel(_ model: Root) {
//        do {
//            try realm.safeWrite {
//                realm.add(model, update: .modified)
//            }
//        }
//        catch {
//            return
//        }
//    }
//    
//    func deleteWikiModel(_ model: Root) {
//        do {
//            try realm.safeWrite {
//                realm.delete(model)
//            }
//        }
//        catch {
//            return
//        }
//    }
//    
//    func appendBirths(_ births: Births, toWiki model: Root) {
//        do {
//            try realm.safeWrite {
////                model.births.append(births)
//            }
//        }
//        catch {
//            return
//        }
//    }
//    
//    
//}
