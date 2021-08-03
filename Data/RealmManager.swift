//
//  RealmManager.swift
//  petProject
//
//  Created by Vlad Kozlov on 31.7.2021.
//

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
    
    
    // MARK: -SignModel

    func writeSignToRealm(from: String, model: SignModel) {
        do {
            try realm.safeWrite {
                model.sign = from
                realm.add(model, update: .modified)
            }
        }
        catch {
            return
        }
    }
    
    func readSign() -> String {
        guard let model = realm.objects(SignModel.self).first else { return "error readSign" }
        let sign = model.sign
        return sign
    }
    
    
    // MARK: -HoroscopeModel
    
    func writeHoroscope(from: String, model: HoroscopeModel) {
        do {
            try realm.safeWrite {
                model.horoscope = from
                realm.add(model, update: .modified)
            }
        }
        catch {
            return
        }
    }
    
    func readHoroscope() -> String {
        guard let model = realm.objects(HoroscopeModel.self).first else { return "Try again" }
        let horoscope = model.horoscope
        return horoscope
    }
    
    
}
