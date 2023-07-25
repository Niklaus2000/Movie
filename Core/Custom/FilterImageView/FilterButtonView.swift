//
//  FilterImageView.swift
//  MovieAPP
//
//  Created by MacBoobPro on 18.07.23.
//

import UIKit

enum ButtonState {
    case unFilter
    case filter
}

// MARK: Filter Protocol
protocol FilterdViewDelegate: AnyObject {
    func filtredView(_ buttonModeView: FilterButtonView, didButtonStateTo state: ButtonState)
}

final class FilterButtonView: UIButton {
    
    weak var delegate: FilterdViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraint
    private func setUp() {
        setImage(LocalConstants.unFilter, for: .normal)
        setImage(LocalConstants.filter, for: .selected)
        translatesAutoresizingMaskIntoConstraints = false
        
        addAction(UIAction(handler: {[weak self] _ in
            self?.switchModeTapped()
        }), for: .touchUpInside)
    }
    
    // MARK: SwitchMode
    private func switchModeTapped() {
        isSelected.toggle()
        delegate?.filtredView(self, didButtonStateTo: isSelected ? .unFilter : .filter)
    }
}

