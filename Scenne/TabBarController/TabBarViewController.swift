//
//  TabBarViewController.swift
//  MovieAPP
//
//  Created by MacBoobPro on 01.08.23.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let tabBarCase: [TabBarEnum] = [.home, .favorites]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .clear
        setUpTabBar()
    }
    
    func setUpTabBar() {
        let viewControllers = tabBarCase.map { controller in
            let navController = UINavigationController(rootViewController: controller.viewController)
            navController.overrideUserInterfaceStyle = .light
            navController.navigationBar.barStyle = .black
           
            return navController
        }
        self.setViewControllers(viewControllers, animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        for (index, item) in items.enumerated() {
            let variant = tabBarCase[index]
            item.image = variant.image
            item.selectedImage = variant.selectedImage
        }
        
        self.tabBar.tintColor = .clear
    }
}
