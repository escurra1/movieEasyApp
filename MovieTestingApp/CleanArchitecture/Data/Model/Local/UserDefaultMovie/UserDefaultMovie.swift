//
//  UserDefaultMovie.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import SwiftyJSON

class UserDefaultMovie: NSObject {
    class func saveJSON(json: JSON, key: String) {
        if let jsonString = json.rawString() {
            UserDefaults.standard.setValue(jsonString, forKey: key)
        }
    }
    
    class func getJSON(_ key: String) -> JSON? {
        var p = ""
        if let result = UserDefaults.standard.string(forKey: key) {
            p = result
        }
        if p != "" {
            if let json = p.data(using: String.Encoding.utf8, allowLossyConversion: false) {
                do {
                    return try JSON(data: json)
                } catch {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
