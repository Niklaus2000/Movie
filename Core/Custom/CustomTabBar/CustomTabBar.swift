//
//  TabBarViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 22.07.23.
//

import Foundation

//import UIKit
//
//enum Tab: Int, CaseIterable {
//    case home, favorites
//
//    var title: String {
//        switch self {
//        case .home:
//            return "Home"
//        case .favorites:
//            return "Favorites"
//        }
//    }
//
//    var icon: String {
//        switch self {
//        case .home:
//            return "home_bar_item"
//        case .favorites:
//            return "favorite_bar_item"
//        }
//    }
//
//    var color: UIColor {
//        switch self {
//        case .home:
//            return .red
//        case .favorites:
//            return .blue
//        }
//    }
//}
//
//class TabBarViewController: UIView {
//    let tabBarHeight: CGFloat = 70
//    let bgColor: UIColor = UIColor(white: 0.9, alpha: 1.0)
//
//    var selectedTab: Tab = .home {
//        didSet {
//            updateTabBarAppearance()
//        }
//    }
//
//    lazy var tabBar: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = tabBarHeight / 2
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.2
//        view.layer.shadowRadius = 5
//        view.layer.shadowOffset = CGSize(width: 0, height: -3)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        //view.backgroundColor = .white
////        setupTabBar()
////        selectInitialTab()
////    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupTabBar()
//        selectInitialTab()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupTabBar() {
//        addSubview(tabBar)
//        NSLayoutConstraint.activate([
//            tabBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            tabBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            tabBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            tabBar.heightAnchor.constraint(equalToConstant: tabBarHeight)
//        ])
//
//        let buttonsStackView = createButtonsStackView()
//        tabBar.addSubview(buttonsStackView)
//        NSLayoutConstraint.activate([
//            buttonsStackView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
//            buttonsStackView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
//            buttonsStackView.topAnchor.constraint(equalTo: tabBar.topAnchor),
//            buttonsStackView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
//        ])
//    }
//
//    private func createButtonsStackView() -> UIStackView {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.alignment = .center
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        for tab in Tab.allCases {
//            let button = createTabButton(tab: tab)
//            stackView.addArrangedSubview(button)
//        }
//
//        return stackView
//    }
//
//    private func createTabButton(tab: Tab) -> UIButton {
//        let button = UIButton()
//        button.tag = tab.rawValue
//        button.setTitle(tab.title, for: .normal)
//        button.setImage(UIImage(systemName: tab.icon), for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//        button.setTitleColor(.black, for: .normal)
//        button.setTitleColor(tab.color, for: .selected)
//        button.tintColor = .black
//        button.contentHorizontalAlignment = .left
//        button.contentVerticalAlignment = .center
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
//        button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
//        return button
//    }
//
//    @objc private func tabButtonTapped(_ sender: UIButton) {
//        guard let selectedTab = Tab(rawValue: sender.tag) else { return }
//        self.selectedTab = selectedTab
//    }
//
//    private func selectInitialTab() {
//        if let initialTabButton = tabBar.subviews.first(where: { ($0 as? UIButton)?.tag == selectedTab.rawValue }) as? UIButton {
//            tabButtonTapped(initialTabButton)
//        }
//    }
//
//    private func updateTabBarAppearance() {
//        for case let button as UIButton in tabBar.subviews {
//            button.isSelected = button.tag == selectedTab.rawValue
//        }
//    }
//}
//
////// Usage:
////class HomeViewController: UIViewController {
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        view.backgroundColor = .systemBlue
////    }
////}
////
////class FavoritesViewController: UIViewController {
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        view.backgroundColor = .systemRed
////    }
////}
////
////let homeVC = HomeViewController()
////let favoritesVC = FavoritesViewController()
////
////let tabBarController = TabBarViewController()
////tabBarController.viewControllers = [homeVC, favoritesVC]
////tabBarController.selectedIndex = 0 // Set initial selected index here
////tabBarController.modalPresentationStyle = .fullScreen
////
////// Show the custom tab bar controller
////if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
////    let window = UIWindow(windowScene: windowScene)
////    window.rootViewController = tabBarController
////    window.makeKeyAndVisible()
//////}

//import UIKit
//
//class CustomTabBar: UIView {
//    var selectedTab: Tab = .home {
//        didSet {
//            updateSelectedTab()
//        }
//    }
//    var namespace: String = ""
//    private var tabButtons: [TabButton] = []
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupTabs()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupTabs() {
//        let tabs = Tab.allCases
//        let buttonWidth: CGFloat = 100
//        let buttonHeight: CGFloat = 70
//        var xOffset: CGFloat = 0
//        
//        for tab in tabs {
//            let tabButton = TabButton(tab: tab, selectedTab: selectedTab)
//            tabButton.frame = CGRect(x: xOffset, y: 0, width: buttonWidth, height: buttonHeight)
//            addSubview(tabButton)
//            tabButtons.append(tabButton)
//            xOffset += buttonWidth
//        }
//        
//        updateSelectedTab()
//    }
//    
//    private func updateSelectedTab() {
//        for tabButton in tabButtons {
//            tabButton.isSelected = tabButton.tab == selectedTab
//        }
//    }
//}
//
//extension CustomTabBar {
//    private class TabButton: UIButton {
//        let tab: Tab
//        var isSelected: Bool = false {
//            didSet {
//                updateSelection()
//            }
//        }
//        
//        init(tab: Tab, selectedTab: Tab) {
//            self.tab = tab
//            self.isSelected = tab == selectedTab
//            super.init(frame: .zero)
//            setupButton()
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//        
//        private func setupButton() {
//            setTitle(tab.title, for: .normal)
//            setTitleColor(tab.color, for: .selected)
//            setTitleColor(.black, for: .normal)
//            setImage(UIImage(systemName: tab.icon), for: .normal)
//            setTitleColor(tab.color.withAlphaComponent(0.7), for: .highlighted)
//            setTitleColor(tab.color.withAlphaComponent(0.2), for: .selected)
//            titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//            imageView?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//            titleLabel?.transform = isSelected ? CGAffineTransform(translationX: 20, y: 0) : .identity
//            titleLabel?.alpha = isSelected ? 1.0 : 0.7
//            imageView?.alpha = isSelected ? 1.0 : 0.7
//            backgroundColor = .white
//            layer.cornerRadius = 35
//            addTarget(self, action: #selector(tabButtonTapped), for: .touchUpInside)
//        }
//        
//        private func updateSelection() {
//            let rotationAngle: CGFloat = isSelected ? 0 : 360
//            let selectedOffset: CGFloat = isSelected ? 0 : -60
//            UIView.animate(withDuration: 0.3, animations: {
//                self.transform = CGAffineTransform(rotationAngle: rotationAngle.toRadians())
//                self.titleLabel?.transform = self.isSelected ? CGAffineTransform(translationX: 20, y: 0) : .identity
//                self.titleLabel?.alpha = self.isSelected ? 1.0 : 0.7
//                self.imageView?.alpha = self.isSelected ? 1.0 : 0.7
//                self.transform = CGAffineTransform(translationX: 0, y: selectedOffset)
//            }) { _ in
//                UIView.animate(withDuration: 0.3) {
//                    self.transform = CGAffineTransform(rotationAngle: (rotationAngle * 2).toRadians())
//                }
//            }
//        }
//        
//        @objc private func tabButtonTapped() {
//            isSelected = true
//            sendActions(for: .touchUpInside)
//        }
//    }
//}
//
//extension CGFloat {
//    func toRadians() -> CGFloat {
//        return self * .pi / 180
//    }
//}
//
//
//enum Tab: CaseIterable {
//    case home, profile, settings
//
//    var title: String {
//        switch self {
//        case .home:
//            return "Home"
//        case .profile:
//            return "Profile"
//        }
//    }
//
//    var icon: String {
//        switch self {
//        case .home:
//            return "house.fill"
//        case .profile:
//            return "person.fill"
//        }
//    }
//
//    var color: UIColor {
//        switch self {
//        case .home:
//            return .systemRed
//        case .profile:
//            return .systemBlue
//        }
//    }
//}
