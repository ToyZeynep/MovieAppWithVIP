//
//  MovieDetailsRouter.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation

protocol MovieDetailsRoutingLogic: AnyObject {

}

protocol MovieDetailsDataPassing: AnyObject {
    var dataStore: MovieDetailsDataStore? { get }
    
}

final class MovieDetailsRouter: MovieDetailsRoutingLogic, MovieDetailsDataPassing {

    weak var viewController: MovieDetailsViewController?
    var dataStore: MovieDetailsDataStore?

}
