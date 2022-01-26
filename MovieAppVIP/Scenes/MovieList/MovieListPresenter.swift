//
//  MovieListPresenter.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation

protocol MovieListPresentationLogic: AnyObject {
    func presentMovies(response: MovieList.Fetch.Response)
    func presentAlert(error: Error)
}

final class MovieListPresenter: MovieListPresentationLogic {

    weak var viewController: MovieListDisplayLogic?

    func presentMovies(response: MovieList.Fetch.Response) {
        // 3
        var movielist: [MovieList.Fetch.ViewModel.Movie] = []

        response.movieList.forEach {
            movielist.append(MovieList.Fetch.ViewModel.Movie(title: $0.title,
                                                 year: $0.year,
                                                 image: $0.poster))
        }

        viewController?.displayMovies(viewModel: MovieList.Fetch.ViewModel(movielist: movielist))
    }

    func presentAlert(error: Error) {

    }
}
