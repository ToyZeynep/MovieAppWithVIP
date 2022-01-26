//
//  MovieListModels.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation
import Foundation

// swiftlint:disable nesting
enum MovieList {

    enum Fetch {

        struct Request {
            let s: String
        }

        struct Response {
            let movieList: [Movie]
        }

        struct ViewModel {
            let movielist: [MovieList.Fetch.ViewModel.Movie]

            struct Movie {
                let title: String?
                let year: String?
                let image: String?
            }
        }
    }
}
