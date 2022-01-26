//
//  MovieDetailsWorker.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//


import Foundation

protocol MovieDetailsWorkingLogic: AnyObject {
    func getMovieDetails(request: MovieDetailsResponse.Request, completion: @escaping ((Result<MovieDetailsResponse, Error>) -> Void))
}

final class MovieDetailsWorker: MovieDetailsWorkingLogic {

    func getMovieDetails(request: MovieDetailsResponse.Request, completion: @escaping ((Result<MovieDetailsResponse, Error>) -> Void)) {

        Requester().request(model: MovieDetailsResponse.self, parameters: request.dictionary) { result in
            switch result {
            case .httpSuccess(let response):
                completion(.success(response))
            case .httpFail(let error):
                completion(.failure(error))
            }
        }
    }
}
