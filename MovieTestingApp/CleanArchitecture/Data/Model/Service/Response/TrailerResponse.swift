//
//  TrailerResponse.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import SwiftyJSON

// MARK: - MovieVideoResponse
class MovieVideoResponse: NSObject, NSCoding {
    var id: Int?
    var trailers: [TrailerResponse]?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        id = json["id"].intValue
        trailers = [TrailerResponse]()
        for resultsJson in json["results"].arrayValue {
            let value = TrailerResponse(fromJson: resultsJson)
            trailers?.append(value)
        }
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil {
            dictionary["id"] = id
        }
        if trailers != nil {
            var dictionaryElements = [[String:Any]]()
            guard let trailerResponse = trailers else {
                return [String:Any]()
            }
            for resultsElement in trailerResponse {
                dictionaryElements.append(resultsElement.toDictionary())
            }
            dictionary["results"] = dictionaryElements
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        trailers = aDecoder.decodeObject(forKey: "results") as? [TrailerResponse]
    }
    
    func encode(with aCoder: NSCoder)
    {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if trailers != nil{
            aCoder.encode(trailers, forKey: "results")
        }
        
    }
    
}

// MARK: - TrailerResponse
class TrailerResponse: NSObject, NSCoding {
    var id: String?
    var iso31661: String?
    var iso6391: String?
    var key: String?
    var name: String?
    var official: Bool?
    var publishedAt: String?
    var site: String?
    var size: Int?
    var type: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        id = json["id"].stringValue
        iso31661 = json["iso_3166_1"].stringValue
        iso6391 = json["iso_639_1"].stringValue
        key = json["key"].stringValue
        name = json["name"].stringValue
        official = json["official"].boolValue
        publishedAt = json["published_at"].stringValue
        site = json["site"].stringValue
        size = json["size"].intValue
        type = json["type"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil {
            dictionary["id"] = id
        }
        if iso31661 != nil {
            dictionary["iso_3166_1"] = iso31661
        }
        if iso6391 != nil {
            dictionary["iso_639_1"] = iso6391
        }
        if key != nil {
            dictionary["key"] = key
        }
        if name != nil {
            dictionary["name"] = name
        }
        if official != nil {
            dictionary["official"] = official
        }
        if publishedAt != nil {
            dictionary["published_at"] = publishedAt
        }
        if site != nil {
            dictionary["site"] = site
        }
        if size != nil {
            dictionary["size"] = size
        }
        if type != nil {
            dictionary["type"] = type
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? String
        iso31661 = aDecoder.decodeObject(forKey: "iso_3166_1") as? String
        iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
        key = aDecoder.decodeObject(forKey: "key") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        official = aDecoder.decodeObject(forKey: "official") as? Bool
        publishedAt = aDecoder.decodeObject(forKey: "published_at") as? String
        site = aDecoder.decodeObject(forKey: "site") as? String
        size = aDecoder.decodeObject(forKey: "size") as? Int
        type = aDecoder.decodeObject(forKey: "type") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if iso31661 != nil {
            aCoder.encode(iso31661, forKey: "iso_3166_1")
        }
        if iso6391 != nil {
            aCoder.encode(iso6391, forKey: "iso_639_1")
        }
        if key != nil {
            aCoder.encode(key, forKey: "key")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if official != nil {
            aCoder.encode(official, forKey: "official")
        }
        if publishedAt != nil {
            aCoder.encode(publishedAt, forKey: "published_at")
        }
        if site != nil {
            aCoder.encode(site, forKey: "site")
        }
        if size != nil {
            aCoder.encode(size, forKey: "size")
        }
        if type != nil {
            aCoder.encode(type, forKey: "type")
        }
    }
    
}
