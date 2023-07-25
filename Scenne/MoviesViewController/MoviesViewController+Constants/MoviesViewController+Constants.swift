//
//  MoviesViewController+Constants.swift
//  MovieAPP
//
//  Created by MacBoobPro on 18.07.23.
//


import UIKit


extension MoviesViewController {
    enum Constants {
        
        enum SearchView {
            static let top: CGFloat = 19
            static let leading: CGFloat = 16
            static let width: CGFloat = 300
            static let height: CGFloat = 36
            static let trailing: CGFloat = -8
            static let backGroundColor = UIColor(
                red: 0.1098,
                green: 0.1098,
                blue: 0.1098,
                alpha: 1.0)
        }
        
        enum ButtonView {
            static let trailingAnchor: CGFloat = -16
        }
        
        enum CellBackGroundColor {
            static let backGroundColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
        }
        
        enum MoviesLaabelView {
            static let textColor = UIColor(
                red: 0.9608,
                green: 0.7725,
                blue: 0.0941,
                alpha: 1.0)
            static let textSize = UIFont.systemFont(ofSize: 18)
            
        }
       
    }
}
