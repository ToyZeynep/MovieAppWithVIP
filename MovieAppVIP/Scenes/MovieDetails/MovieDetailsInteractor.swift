//
//  MovieDetailsInteractor.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//



import Foundation

protocol MovieDetailsBusinessLogic: AnyObject {
    func fetchMovie(request: MovieDetails.Fetch.Request)
}

protocol MovieDetailsDataStore: class {
    var movie: MovieDetailsResponse? { get }
    var imdbId: String? { get set }
}

class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailsDataStore {
  
    var imdbId: String?
    var movie: MovieDetailsResponse?
    var presenter: MovieDetailsPresentationLogic?
    var worker: MovieDetailsWorkingLogic

    init(worker: MovieDetailsWorkingLogic ) {
        self.worker = worker
    }

    func fetchMovie(request: MovieDetails.Fetch.Request) {
        // 2
        worker.getMovieDetails(request: MovieDetailsResponse.Request(i: request.i)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movie = response
                guard let movieDetails = self?.movie else { return }
                self?.presenter?.presentMovie(response: MovieDetails.Fetch.Response(movie: movieDetails))
            case .failure(let error):
                self?.presenter?.presentAlert(error: error)
            }
        }
    }
}
