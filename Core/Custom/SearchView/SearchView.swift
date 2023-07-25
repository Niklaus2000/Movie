//
//  SearchView.swift
//  MovieAPP
//
//  Created by MacBoobPro on 17.07.23.
//

import UIKit

final class SearchView: UIView {
    
    private let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search_image")
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textColor = .white
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpFunc()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        [searchImage, textField].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpFunc() {
        setImageConstraints()
        setTextFieldConstraints()
    }
    
    private func setImageConstraints() {
        NSLayoutConstraint.activate([
            searchImage.topAnchor.constraint(
                equalTo: topAnchor, constant: 11),
            searchImage.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.ImageView.leading),
            searchImage.heightAnchor.constraint(
                equalToConstant: 13),
            searchImage.widthAnchor.constraint(
                equalToConstant: 15)
        ])
    }
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: topAnchor, constant: 9),
            textField.leadingAnchor.constraint(
                equalTo: searchImage.trailingAnchor,
                constant: Constants.TextField.leading),
            textField.trailingAnchor.constraint(
                equalTo: trailingAnchor)
        ])
    }
}
