//
//  RealmManager.swift
//  petProject
//
//  Created by Vlad Kozlov on 31.7.2021.
//

import Foundation
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}

class RealmManager {
    static let shared = RealmManager()

    private let realm: Realm!

    private init() {
        realm = try! Realm()
        print("RealmURL: ", realm.configuration.fileURL as Any)
    }

    func writeSignToRealm(model: SignModel) {
        do {
            try realm.safeWrite {
                realm.add(model, update: .modified)
            }
        }
        catch {
            return
        }
    }
    
    func readSign() -> String {
        guard let model = realm.objects(SignModel.self).first else { return "buepf" }
        let sign = model.sign
        return sign
    }
    
//    TODO: here
//    func writeHoroscope(model)
}
