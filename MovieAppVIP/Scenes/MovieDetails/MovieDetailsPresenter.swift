//
//  MovieDetailsPresenter.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation

protocol MovieDetailsPresentationLogic: AnyObject {
    func presentMovie(response: MovieDetails.Fetch.Response)
    func presentAlert(error: Error)
}

final class MovieDetailsPresenter: MovieDetailsPresentationLogic {

    weak var viewController: MovieDetailsDisplayLogic?

    func presentMovie(response: MovieDetails.Fetch.Response) {
        // 3
        viewController?.displayMovieDetails(viewModel: MovieDetails.Fetch.ViewModel(
            title: response.movie?.title ,
            image: response.movie?.poster,
            plot: response.movie?.plot,
            director: response.movie?.director
        
       
       
       ))
    }

    func presentAlert(error: Error) {

    }
}
