//
//  MovieResponse.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import SwiftyJSON

// MARK: - WelcomeMovieResponse
class WelcomeMovieResponse: NSObject, NSCoding {
    var page: Int?
    var results: [MovieResponse]?
    var totalPages: Int?
    var totalResults: Int?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        page = json["page"].intValue
        results = [MovieResponse]()
        
        for resultsJson in json["results"].arrayValue {
            let item =  MovieResponse(fromJson: resultsJson)
            results?.append(item)
        }
        totalPages = json["total_pages"].intValue
        totalResults = json["total_results"].intValue
    }
    
    override init() {
        page = 0
        results = []
        totalPages = 0
        totalResults = 0
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if page != nil {
            dictionary["page"] = page
        }
        if results != nil {
            guard let resultResponse = results else {
                return [String:Any]()
            }
            var dictionaryElements = [[String:Any]]()
            for resultsElement in resultResponse {
                dictionaryElements.append(resultsElement.toDictionary())
            }
            dictionary["results"] = dictionaryElements
        }
        if totalPages != nil {
            dictionary["total_pages"] = totalPages
        }
        if totalResults != nil {
            dictionary["total_results"] = totalResults
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        page = aDecoder.decodeObject(forKey: "page") as? Int
        results = aDecoder.decodeObject(forKey: "results") as? [MovieResponse]
        totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int
        totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int
    }
    
    func encode(with aCoder: NSCoder)
    {
        if page != nil {
            aCoder.encode(page, forKey: "page")
        }
        if results != nil {
            aCoder.encode(results, forKey: "results")
        }
        if totalPages != nil {
            aCoder.encode(totalPages, forKey: "total_pages")
        }
        if totalResults != nil {
            aCoder.encode(totalResults, forKey: "total_results")
        }
        
    }
    
}

// MARK: - MovieResponse
class MovieResponse: NSObject, NSCoding {
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Float?
    var voteCount: Int?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        genreIds = [Int]()
        let genreIdsArray = json["genre_ids"].arrayValue
        for genreIdsJson in genreIdsArray {
            genreIds?.append(genreIdsJson.intValue)
        }
        id = json["id"].intValue
        originalLanguage = json["original_language"].stringValue
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].floatValue
        posterPath = json["poster_path"].stringValue
        releaseDate = json["release_date"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].floatValue
        voteCount = json["vote_count"].intValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if adult != nil {
            dictionary["adult"] = adult
        }
        if backdropPath != nil {
            dictionary["backdrop_path"] = backdropPath
        }
        if genreIds != nil {
            dictionary["genre_ids"] = genreIds
        }
        if id != nil {
            dictionary["id"] = id
        }
        if originalLanguage != nil {
            dictionary["original_language"] = originalLanguage
        }
        if originalTitle != nil {
            dictionary["original_title"] = originalTitle
        }
        if overview != nil {
            dictionary["overview"] = overview
        }
        if popularity != nil {
            dictionary["popularity"] = popularity
        }
        if posterPath != nil {
            dictionary["poster_path"] = posterPath
        }
        if releaseDate != nil {
            dictionary["release_date"] = releaseDate
        }
        if title != nil {
            dictionary["title"] = title
        }
        if video != nil {
            dictionary["video"] = video
        }
        if voteAverage != nil {
            dictionary["vote_average"] = voteAverage
        }
        if voteCount != nil {
            dictionary["vote_count"] = voteCount
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        adult = aDecoder.decodeObject(forKey: "adult") as? Bool
        backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
        genreIds = aDecoder.decodeObject(forKey: "genre_ids") as? [Int]
        id = aDecoder.decodeObject(forKey: "id") as? Int
        originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
        originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
        overview = aDecoder.decodeObject(forKey: "overview") as? String
        popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
        posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
        releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        video = aDecoder.decodeObject(forKey: "video") as? Bool
        voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
    }
    
    func encode(with aCoder: NSCoder)
    {
        if adult != nil {
            aCoder.encode(adult, forKey: "adult")
        }
        if backdropPath != nil {
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if genreIds != nil {
            aCoder.encode(genreIds, forKey: "genre_ids")
        }
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if originalLanguage != nil {
            aCoder.encode(originalLanguage, forKey: "original_language")
        }
        if originalTitle != nil {
            aCoder.encode(originalTitle, forKey: "original_title")
        }
        if overview != nil {
            aCoder.encode(overview, forKey: "overview")
        }
        if popularity != nil {
            aCoder.encode(popularity, forKey: "popularity")
        }
        if posterPath != nil {
            aCoder.encode(posterPath, forKey: "poster_path")
        }
        if releaseDate != nil {
            aCoder.encode(releaseDate, forKey: "release_date")
        }
        if title != nil {
            aCoder.encode(title, forKey: "title")
        }
        if video != nil {
            aCoder.encode(video, forKey: "video")
        }
        if voteAverage != nil {
            aCoder.encode(voteAverage, forKey: "vote_average")
        }
        if voteCount != nil {
            aCoder.encode(voteCount, forKey: "vote_count")
        }
        
    }
    
}

// MARK: - ProductionCompany
class ProductionCompany: NSObject, NSCoding{
    var id: Int?
    var logoPath: String?
    var name: String?
    var originCountry: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        id = json["id"].intValue
        logoPath = json["logo_path"].stringValue
        name = json["name"].stringValue
        originCountry = json["origin_country"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil {
            dictionary["id"] = id
        }
        if logoPath != nil {
            dictionary["logo_path"] = logoPath
        }
        if name != nil {
            dictionary["name"] = name
        }
        if originCountry != nil {
            dictionary["origin_country"] = originCountry
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        logoPath = aDecoder.decodeObject(forKey: "logo_path") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        originCountry = aDecoder.decodeObject(forKey: "origin_country") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if logoPath != nil {
            aCoder.encode(logoPath, forKey: "logo_path")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if originCountry != nil {
            aCoder.encode(originCountry, forKey: "origin_country")
        }
        
    }
    
}

// MARK: - ProductionCountry
class ProductionCountry: NSObject, NSCoding {
    var iso31661: String?
    var name: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        iso31661 = json["iso_3166_1"].stringValue
        name = json["name"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if iso31661 != nil {
            dictionary["iso_3166_1"] = iso31661
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        iso31661 = aDecoder.decodeObject(forKey: "iso_3166_1") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if iso31661 != nil {
            aCoder.encode(iso31661, forKey: "iso_3166_1")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        
    }
    
}

// MARK: - SpokenLanguage
class SpokenLanguage: NSObject, NSCoding {
    var englishName: String?
    var iso6391: String?
    var name: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        englishName = json["english_name"].stringValue
        iso6391 = json["iso_639_1"].stringValue
        name = json["name"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if englishName != nil {
            dictionary["english_name"] = englishName
        }
        if iso6391 != nil {
            dictionary["iso_639_1"] = iso6391
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        englishName = aDecoder.decodeObject(forKey: "english_name") as? String
        iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if englishName != nil {
            aCoder.encode(englishName, forKey: "english_name")
        }
        if iso6391 != nil {
            aCoder.encode(iso6391, forKey: "iso_639_1")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        
    }
    
}

// MARK: - Genre
class Genre: NSObject, NSCoding {
    var id: Int?
    var name: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        id = json["id"].intValue
        name = json["name"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil {
            dictionary["id"] = id
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        
    }
    
}

// MARK: - BelongsToCollection
class BelongsToCollection: NSObject, NSCoding {
    var backdropPath: String?
    var id: Int?
    var name: String?
    var posterPath: String?
    
    init(fromJson json: JSON) {
        if json.isEmpty {
            return
        }
        backdropPath = json["backdrop_path"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        posterPath = json["poster_path"].stringValue
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if backdropPath != nil {
            dictionary["backdrop_path"] = backdropPath
        }
        if id != nil {
            dictionary["id"] = id
        }
        if name != nil {
            dictionary["name"] = name
        }
        if posterPath != nil {
            dictionary["poster_path"] = posterPath
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
        backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        if backdropPath != nil {
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if posterPath != nil {
            aCoder.encode(posterPath, forKey: "poster_path")
        }
        
    }
    
}
