//
//  MovieListTableViewCell.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: MovieList.Fetch.ViewModel.Movie) {
        movieTitleLabel.text = viewModel.title
        movieYearLabel.text = viewModel.year
        let urlString = viewModel.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        movieImageView.kf.setImage(with: URL(string: urlString!))
    }
}

