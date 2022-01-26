//
//  MovieListInteractor.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation

protocol MovieListBusinessLogic: AnyObject {
    func fetchMovies(request: MovieList.Fetch.Request)
}

protocol MovieListDataStore: AnyObject {
    var movieList: [Movie]? { get }
}

class MovieListInteractor: MovieListBusinessLogic, MovieListDataStore {
 
    var presenter: MovieListPresentationLogic?
    var worker: MovieListWorkingLogic

    init(worker: MovieListWorkingLogic) {
        self.worker = worker
    }

    var movieList: [Movie]?

    func fetchMovies(request: MovieList.Fetch.Request) {
        // 2
        worker.getNews(request: MovieListResponse.Request(s: request.s)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movieList = response.movies
                guard let movieList = self?.movieList else { return }
                self?.presenter?.presentMovies(response: MovieList.Fetch.Response(movieList: movieList))
            case .failure(let error):
                self?.presenter?.presentAlert(error: error)
            }
        }
    }
}
