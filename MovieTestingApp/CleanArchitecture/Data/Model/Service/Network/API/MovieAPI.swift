//
//  MovieAPI.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation
import SwiftyJSON
import Alamofire

enum TypeApi {
    case upcoming
}

enum ResponseResult {
    case success(result: JSON)
    case failure(NSError)
}

struct ResponseCode {
    static var loginAgain = 404
    static var success = 200
    static var permissionDenied = 401
}

class HeaderAPI: NSObject {
    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        return headers
    }
}
