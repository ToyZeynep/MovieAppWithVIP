//
//  MovieListRouter.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import Foundation
import UIKit

protocol MovieListRoutingLogic: AnyObject {

    func routeToMovieDetail(index: Int)
}

protocol MovieListDataPassing: AnyObject {
    var dataStore: MovieListDataStore? { get }
}

final class MovieListRouter: MovieListRoutingLogic, MovieListDataPassing {
    
    weak var viewController: MovieListViewController?
    var dataStore: MovieListDataStore?

    func routeToMovieDetail(index: Int) {
        let storyBoard = UIStoryboard(name: "MovieDetails", bundle: nil)
        let destVC: MovieDetailsViewController = storyBoard.instantiateViewController(
            identifier: "DetailViewController"
        )
        // data passing sample
      //  destVC.router?.dataStore?.article = dataStore?.movieList?[index]
      //  self.viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
