//
//  MovieDetailsViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 25.07.23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private let moviePoster: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "movie_image1")
        return image
    }()
    
    private lazy var trailerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "details_button"), for: .normal)
        return button
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "The Atonement"
        movieTitle.textColor = .white
        movieTitle.textAlignment = .left
        movieTitle.font = .boldSystemFont(ofSize: 20)
        return movieTitle
    }()
    private let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favorite_image"), for: .normal)
        favoriteButton.imageView?.contentMode = .scaleAspectFill
        return favoriteButton
    }()
    
    private let ratingLabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.text = "⭐ 7.9"
        ratingLabel.textColor = .white
        ratingLabel.backgroundColor = .green
        ratingLabel.textAlignment = .center
        ratingLabel.font = .systemFont(ofSize: 14)
        ratingLabel.layer.cornerRadius = 14
        
        return ratingLabel
    }()
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.textColor = .white
        genreLabel.backgroundColor = .green
        genreLabel.textAlignment = .center
        genreLabel.font = .systemFont(ofSize: 14)
        genreLabel.text = "Romance"
        genreLabel.layer.cornerRadius = 14
        genreLabel.layer.masksToBounds = true
        
        return genreLabel
    }()
    
    private lazy var movieDurationLabel: UILabel = {
        let movieDuration = UILabel()
        movieDuration.textColor = .white
        movieDuration.backgroundColor = .green
        movieDuration.textAlignment = .center
        movieDuration.text = "1,50"
        movieDuration.font = .systemFont(ofSize: 14)
        return movieDuration
    }()
    
    private let movieYear: UILabel = {
        let movieYear = UILabel()
        movieYear.text = "2007"
        movieYear.textColor =  .white
        movieYear.backgroundColor =  .green
        movieYear.textAlignment = .center
        movieYear.font = .systemFont(ofSize: 14)
        movieYear.layer.cornerRadius = 14
        movieYear.layer.masksToBounds = true
        
        return movieYear
    }()
    
    private let aboutMovieLabel: UILabel = {
        let aboutMovieLabel = UILabel()
        aboutMovieLabel.text = "About movie"
        aboutMovieLabel.textColor =  .white
        aboutMovieLabel.textAlignment = .left
        aboutMovieLabel.font = .boldSystemFont(ofSize: 16)
        return aboutMovieLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Thirteen-year-old fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit."
        descriptionLabel.textColor =  .white
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .boldSystemFont(ofSize: 16)
        
        return descriptionLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpFuncOfConstraints()
        setUpNavigationBar()
        
    }
    
    
    
    
    private func setUp() {
        [moviePoster, movieTitle, favoriteButton, stackView, aboutMovieLabel, descriptionLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [ratingLabel, genreLabel, movieDurationLabel, movieYear].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        moviePoster.addSubview(trailerButton)
        trailerButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setUpFuncOfConstraints() {
        setUpMoviePosterConstraints()
        setupTrailerButtonConstraints()
        setUpFavoriteButtonConstraints()
        setUpMovieTitleConstraints()
        setUpMovieTitleConstraints()
        setUpaboutMovieLabelConstraints()
        setUpDescriptionConstraints()
        setUpStackView()
    }
    
    
    
    private func setUpNavigationBar() {
        self.title = "Details"
            
        
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        if let navigationBar = self.navigationController?.navigationBar {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: navigationBar.frame.width, height: navigationBar.frame.height))
            titleLabel.text = self.title
            titleLabel.textColor = UIColor.white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textAlignment = .center
            navigationItem.titleView = titleLabel
        }
    }
    
    private func setUpMoviePosterConstraints() {
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviePoster.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            moviePoster.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            moviePoster.heightAnchor.constraint(
                equalToConstant: 380)
        ])
    }
    
    private func setupTrailerButtonConstraints() {
        NSLayoutConstraint.activate([
            trailerButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16),
            trailerButton.bottomAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: -20)
        ])
    }
    
    private func setUpMovieTitleConstraints() {
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(
                equalTo: moviePoster.bottomAnchor,
                constant: 26),
            movieTitle.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16),
        ])
    }
    
    private func setUpFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(
                equalTo: movieTitle.centerYAnchor),
            favoriteButton.widthAnchor.constraint(
                equalToConstant: 50),
            favoriteButton.heightAnchor.constraint(
                equalToConstant: 50),
            favoriteButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16),
        ])
    }
    
    private func setUpaboutMovieLabelConstraints() {
        NSLayoutConstraint.activate([
            aboutMovieLabel.topAnchor.constraint(
                equalTo: movieTitle.bottomAnchor,
                constant: 64),
            aboutMovieLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16),
            aboutMovieLabel.heightAnchor.constraint(
                equalToConstant: 21)
        ])
    }
    
    private func setUpDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: aboutMovieLabel.bottomAnchor,
                constant: 8),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16),
        ])
    }
    
    private func setUpStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: movieTitle.bottomAnchor,
                constant: 12),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16),
            stackView.trailingAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16),
            stackView.heightAnchor.constraint(
                equalToConstant: 26)
        ])
    }
}


