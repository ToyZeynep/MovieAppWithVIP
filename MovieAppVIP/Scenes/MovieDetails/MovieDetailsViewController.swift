//
//  MovieDetailsViewController.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import UIKit
import Kingfisher

protocol MovieDetailsDisplayLogic: AnyObject {
    func displayMovieDetails(viewModel: MovieDetails.Fetch.ViewModel)
}


class MovieDetailsViewController: UIViewController {
    var interactor: MovieDetailsBusinessLogic?
    var router: (MovieDetailsRoutingLogic & MovieDetailsDataPassing)?
    var viewModel: MovieDetails.Fetch.ViewModel?
    @IBOutlet weak var movieDetailsImageView: UIImageView!
    @IBOutlet weak var movieDetailDirectorLabel: UILabel!
    @IBOutlet weak var movieDetailsPlotLabel: UILabel!
    @IBOutlet weak var movieDetailsNameLabel: UILabel!
    
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = MovieDetailsInteractor(worker: MovieDetailsWorker())
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchMovie(request: MovieDetails.Fetch.Request(i: (router?.dataStore!.imdbId)!))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension MovieDetailsViewController: MovieDetailsDisplayLogic {
   

    func displayMovieDetails(viewModel: MovieDetails.Fetch.ViewModel) {
     
        DispatchQueue.main.async {
            let urlString = viewModel.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
           self.movieDetailsImageView.kf.setImage(with: URL(string: urlString!))
            self.movieDetailsNameLabel.text = viewModel.title
            self.movieDetailsPlotLabel.text = viewModel.plot
            self.movieDetailDirectorLabel.text = viewModel.director
        }
    }
}
