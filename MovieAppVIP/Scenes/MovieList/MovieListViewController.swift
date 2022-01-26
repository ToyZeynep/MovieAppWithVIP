//
//  MovieListViewController.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import UIKit

protocol MovieListDisplayLogic: AnyObject {
    func displayMovies(viewModel: MovieList.Fetch.ViewModel)
}


final class MovieListViewController: UIViewController {
    var interactor: MovieListBusinessLogic?
    var router: (MovieListRoutingLogic & MovieListDataPassing)?
    var viewModel: MovieList.Fetch.ViewModel?
 


    @IBOutlet weak var movieListTableView: UITableView!
    
    @IBOutlet weak var movieListSearchTextField: UITextField!
    
    @IBOutlet weak var movieListSearchButton: UIButton!
    
    @IBAction func searchButton(_ sender: Any) {
        interactor?.fetchMovies(request: MovieList.Fetch.Request(s: movieListSearchTextField.text!))
    }
    
    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        
        movieListTableView.registerNib(MovieListTableViewCell.self, bundle: .main)
    }
    
    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = MovieListInteractor(worker: MovieListWorker())
        let presenter = MovieListPresenter()
        let router = MovieListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: MovieListDisplayLogic

 
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension MovieListViewController: MovieListDisplayLogic {
    func displayMovies(viewModel: MovieList.Fetch.ViewModel) {
        self.viewModel = viewModel
        movieListTableView.reloadData()
        
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movielist.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueCell(type: MovieListTableViewCell.self, indexPath: indexPath)
        guard let model = self.viewModel?.movielist[indexPath.row]  else {
            return UITableViewCell()
        }
        cell.configure(viewModel: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToMovieDetail(index: indexPath.row)
    }
}
