//
//  MovieListWorker.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//



import Foundation

protocol MovieListWorkingLogic: AnyObject {
    func getMovieList(request: MovieListResponse.Request, completion: @escaping ((Result<MovieListResponse, Error>) -> Void))
}

final class MovieListWorker: MovieListWorkingLogic {

    func getMovieList(request: MovieListResponse.Request, completion: @escaping ((Result<MovieListResponse, Error>) -> Void)) {

        Requester().request(model: MovieListResponse.self, parameters: request.dictionary) { result in
            switch result {
            case .httpSuccess(let response):
                completion(.success(response))
            case .httpFail(let error):
                completion(.failure(error))
            }
        }
    }
}
