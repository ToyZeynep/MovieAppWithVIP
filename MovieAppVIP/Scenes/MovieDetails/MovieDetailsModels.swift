//
//  MovieDetailsModels.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation

// swiftlint:disable nesting
enum MovieDetails {

    enum Fetch {

        struct Request {
            let i: String
        }

        struct Response {
            let movie : MovieDetailsResponse?
        }

        struct ViewModel {
                let title: String?
                let image: String?
                let plot : String?
                let director: String?
            
        }
    }
}
