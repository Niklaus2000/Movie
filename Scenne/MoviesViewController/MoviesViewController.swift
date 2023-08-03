//
//  ViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 17.07.23.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    private var filteredMovies: [Movie] = []
    private var selectedGenre: String?
    private var lastSelectedGenre: String? = nil
    
    private let searchView: SearchView = {
        let view = SearchView()
        view.layer.cornerRadius = 16
        view.backgroundColor = Constants.SearchView.backGroundColor
        return view
    }()
    
    private lazy var buttonView: FilterButtonView = {
        let button = FilterButtonView()
        button.delegate = self
        return button
    }()
    
    private lazy var movieGenreCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.register(MovieGenreCollectionViewCell.self, forCellWithReuseIdentifier: "MovieGenreCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private let moviesLabelView: UILabel = {
        let label = UILabel()
        label.text = "Movies"
        label.font = Constants.MoviesLaabelView.textSize
        label.textColor = Constants.MoviesLaabelView.textColor
        return label
    }()
    
    private lazy var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private var titleLabelTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpSearchViewConstraints()
        setUpFilterImageView()
        setupGenreCollectionViewConstraints()
        setupTitleLabelConstraints()
        setupMoviesCollectionView()
        movieGenreCollectioView.isHidden = true
        titleLabelTopConstraint.constant = 22
    }
    
    private func setUp() {
        [
            searchView,
            buttonView,
            movieGenreCollectioView,
            moviesLabelView,
            moviesCollectionView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpFilterImageView() {
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.ButtonView.trailingAnchor)
        ])
    }
    
    private func setUpSearchViewConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.SearchView.leading),
            searchView.trailingAnchor.constraint(
                equalTo: buttonView.leadingAnchor,
                constant: Constants.SearchView.trailing),
            searchView.heightAnchor.constraint(
                equalToConstant: Constants.SearchView.height),
            searchView.widthAnchor.constraint(
                equalToConstant: Constants.SearchView.width)
        ])
    }
    
    private func setupGenreCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            movieGenreCollectioView.topAnchor.constraint(
                equalTo: searchView.bottomAnchor,
                constant: 8),
            movieGenreCollectioView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20),
            movieGenreCollectioView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            movieGenreCollectioView.heightAnchor.constraint(
                equalToConstant: 30)
        ])
    }
    
    private func setupMoviesCollectionView() {
        view.addSubview(moviesCollectionView)
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(
                equalTo: moviesLabelView.bottomAnchor),
            moviesCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 16),
            moviesCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -16),
            moviesCollectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        titleLabelTopConstraint = moviesLabelView.topAnchor.constraint(
            equalTo: searchView.bottomAnchor,
            constant: movieGenreCollectioView.isHidden ? 22 : 52)
        
        NSLayoutConstraint.activate([
            titleLabelTopConstraint,
            moviesLabelView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16),
        ])
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == movieGenreCollectioView {
            return genres.count
        } else if collectionView == moviesCollectionView {
            return selectedGenre != nil ? filteredMovies.count : movies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.movieGenreCollectioView {
            let movieGenreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGenreCollectionViewCell", for: indexPath) as! MovieGenreCollectionViewCell
            let genre = genres[indexPath.row]
            movieGenreCollectionViewCell.configure(with: genre)
            
            // Set isCellSelected based on the currently selected genre
            movieGenreCollectionViewCell.isCellSelected = genre == selectedGenre
            
            return movieGenreCollectionViewCell
        } else if collectionView == self.moviesCollectionView {
            let moviesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
            
            // Use the filteredMovies array if there is a selected genre, otherwise use the original movies array
            let movie = selectedGenre != nil ? filteredMovies[indexPath.row] : movies[indexPath.row]
            moviesCollectionViewCell.configure(with: movie)
            
            return moviesCollectionViewCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == movieGenreCollectioView {
            let selectedGenre = genres[indexPath.row]
            if self.lastSelectedGenre != selectedGenre {
                self.lastSelectedGenre = selectedGenre
                self.selectedGenre = selectedGenre
                
                filterMoviesByGenre()
                
                collectionView.reloadData()
            } else {
                self.lastSelectedGenre = nil
                self.selectedGenre = nil
                
                filterMoviesByGenre()
                
                collectionView.reloadData()
            }
        }
        
        if collectionView == moviesCollectionView {
            guard collectionView.cellForItem(at: indexPath) is MoviesCollectionViewCell else {
                return
            }
            let vc = MovieDetailsViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func filterMoviesByGenre() {
        if let selectedGenre = self.selectedGenre {
            self.filteredMovies = movies.filter { $0.genre.lowercased() == selectedGenre.lowercased() }
        } else {
            self.filteredMovies = movies
        }
        moviesCollectionView.reloadData()
    }
}


extension MoviesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == movieGenreCollectioView {
            let genre = genres[indexPath.row]
            
            let cell = MovieGenreCollectionViewCell(frame: CGRect.zero)
            cell.configure(with: genre)
            cell.genreLabelView.preferredMaxLayoutWidth = collectionView.bounds.width - 16
            let labelSize = cell.genreLabelView.intrinsicContentSize
            let cellWidth = labelSize.width + 16
            return CGSize(width: cellWidth, height: 26)
        } else if collectionView == moviesCollectionView{
            return CGSize(width: 150, height: 250)
        }
        return CGSize()
    }
}

extension MoviesViewController: FilterdViewDelegate {
    func filtredView(_ buttonModeView: FilterButtonView, didButtonStateTo state: ButtonState) {
        switch state {
        case .filter:
            movieGenreCollectioView.isHidden = true
            titleLabelTopConstraint.constant = 22
        case .unFilter:
            movieGenreCollectioView.isHidden = false
            titleLabelTopConstraint.constant = 52
        }
    }
}
