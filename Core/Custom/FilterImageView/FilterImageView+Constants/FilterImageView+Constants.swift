//
//  FilterImageView+Constants.swift
//  MovieAPP
//
//  Created by MacBoobPro on 18.07.23.
//

import UIKit

extension FilterButtonView {
    struct LocalConstants {
        static let unFilter = UIImage(named: "unFilter_image_view")
        static let filter = UIImage(named: "filter_image_view")
    }
    
    // MARK: Extension
    enum ButtonState {
        case filtred
        case unFiltred
    }
}
