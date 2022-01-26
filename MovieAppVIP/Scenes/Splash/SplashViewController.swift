//
//  SplashViewController.swift
//  MovieAppVIP
//
//  Created by MacOS on 25.01.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let storyBoard = UIStoryboard(name: "MovieList", bundle: nil)
            let destVC = storyBoard.instantiateViewController(withIdentifier: "MovieList")
            destVC.modalPresentationStyle = .overFullScreen
            self.present(destVC, animated: false, completion: nil)
        }
    }
}
