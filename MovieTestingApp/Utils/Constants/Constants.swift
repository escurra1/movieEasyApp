//
//  Constants.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import Foundation

struct Constants {
    struct Api {
        static let apiKey = "ea7c8c264009eb8757ae4108234a70b9"
    }
    
    struct Urls {
        static let baseUrl = "https://api.themoviedb.org/3/movie"
        static let upcoming = "/upcoming?api_key=\(Constants.Api.apiKey)"
        static let upcomingPage = "/upcoming?page={page}&api_key=\(Constants.Api.apiKey)"
        static let detail = "/{movie_id}?api_key=\(Constants.Api.apiKey)"
        static let trailer = "/{movie_id}/videos?api_key=\(Constants.Api.apiKey)"
        static let imageURL = "https://image.tmdb.org/t/p/w500"
        static let imageOrignalURL = "https://image.tmdb.org/t/p/original"
    }
    
    struct User {
        static let userName = "Admin"
        static let passwordName = "Password*123."
    }
    
    struct ViewControllers {
        static let loginViewController = "LoginViewController"
        static let listMovieViewController = "ListMovieViewController"
        static let detailMovieViewController = "DetailMovieViewController"
        static let movieTrailerViewController = "MovieTrailerViewController"
    }
    
    struct Storyboards {
        static let loginStoryboard = "Login"
        static let moviesStoryboard = "Movies"
    }
    
    struct Cells {
        static let upcomingCell = "UpcomingCollectionViewCell"
    }
    
    struct Pattern {
        static let characterAllow = "^[A-Za-zÑ-ñ-á-é-í-ó-ú ]+$"
        static let charactersNotAllowed = """
                [$&+€~£¥•¢{}≠´∞,¬÷:;=¿?@.-;#0123456789|'/_<>^*()-%¡!]""
                """
    }
}
