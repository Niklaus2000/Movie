//
//  GenreCollectionViewCell.swift
//  MovieAPP
//
//  Created by MacBoobPro on 19.07.23.
//


import UIKit

class MovieGenreCollectionViewCell: UICollectionViewCell {
    
    let genreLabelView: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCellLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = Constants.GenreLabelView.cornerRadius
        layer.borderWidth = Constants.GenreLabelView.borderWidth
        layer.borderColor = UIColor.white.cgColor
    }
    
    var isCellSelected: Bool = false {
          didSet {
              // Update the cell's appearance based on the selection state
              backgroundColor = isCellSelected ? Constants.CellBackGroundColor.backGroundColor : .clear
              genreLabelView.textColor = isCellSelected ? .black : .white
          }
      }
    
    func setupCellLabelConstraints() {
        contentView.addSubview(genreLabelView)
        NSLayoutConstraint.activate([
            genreLabelView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.GenreLabelView.top),
            genreLabelView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.GenreLabelView.leading)
        ])
    }
    
    func configure(with genre: String) {
        genreLabelView.text = genre
    }
    
    func setLabelTextColor(_ color: UIColor) {
        genreLabelView.textColor = color
    }
}
