//
//  SplashScreenViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 17.07.23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: Constants.Image.image)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpConstraints()
        
        view.backgroundColor = .black
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigateToMoviesScreen()
        }
    }
    
    private func navigateToMoviesScreen() {
        let movieViewController = MoviesViewController()
        movieViewController.navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.pushViewController(movieViewController, animated: false)
    }
    
    private func setUpConstraints() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
        ])
    }
}

private extension SplashScreenViewController {
    enum Constants {
        enum Image {
            static let image = UIImage(named: "splash_screen_image")
        }
    }
}

