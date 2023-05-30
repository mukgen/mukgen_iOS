////
////  TapBarViewController.swift
////  Mukgen
////
////  Created by 이은호 on 2023/05/30.
////
//
//import UIKit
//
//class TapBarViewController: UITabBarController {
//
//    private lazy var homeViewController: UINavigationController = {
//        let viewController = MainViewController()
//        let tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "Home"), tag: 0)
//        viewController.tabBarItem = tabBarItem
//        let navigationView = UINavigationController(rootViewController: viewController)
//        return navigationView
//    }()
//
//    private lazy var boardViewController: UIViewController = {
//        let viewController = UIViewController()
//        let tabBarItem = UITabBarItem(title: "게시판", image: UIImage(named: "Board"), tag: 1)
//        viewController.tabBarItem = tabBarItem
//        let navigationView = UINavigationController(rootViewController: viewController)
//        return navigationView
//    }()
//
//    private lazy var suggestionMealViewController: UIViewController = {
//        let viewController = UIViewController()
//        let tabBarItem = UITabBarItem(title: "급식 건의", image: UIImage(named: "Ansdml"), tag: 2)
//        viewController.tabBarItem = tabBarItem
//        let navigationView = UINavigationController(rootViewController: viewController)
//        return navigationView
//    }()
//
//    private lazy var reviewViewController: UIViewController = {
//        let viewController = UIViewController()
//        let tabBarItem = UITabBarItem(title: "급식 리뷰", image: UIImage(named: "Star"), tag: 3)
//        viewController.tabBarItem = tabBarItem
//        let navigationView = UINavigationController(rootViewController: viewController)
//        return navigationView
//    }()
//
//    private lazy var deliveryViewcontroller: UIViewController = {
//        let viewController = UIViewController()
//        let tabBarItem = UITabBarItem(title: "배달 파티", image: UIImage(named: "Users"), tag: 4)
//        viewController.tabBarItem = tabBarItem
//        let navigationView = UINavigationController(rootViewController: viewController)
//        return navigationView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        viewControllers = [homeViewController,
//                           boardViewController,
//                           suggestionMealViewController,
//                           reviewViewController,
//                           deliveryViewcontroller]
//
//    }
//}
import UIKit
import Then
import SnapKit

class TapBarViewController : UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: MainViewController())
        let tabOneBarItem =  UITabBarItem(title: "홈", image: UIImage(named: "Home"), tag: 0)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let boardVC = UINavigationController(rootViewController: UIViewController())
        let tabTwoBarItem2 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "chart.bar.fill"),
                                          tag: 2)
        
        boardVC.tabBarItem = tabTwoBarItem2
        
        let suggestionMealVC = UINavigationController(rootViewController: UIViewController())
        let tabThrBarItem3 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "magnifyingglass"),
                                          tag: 3)
        
        suggestionMealVC.tabBarItem = tabThrBarItem3
        
        let reviewVC = UINavigationController(rootViewController: UIViewController())
        let tabFouBarItem4 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "cart"),
                                          tag: 4)
        
        reviewVC.tabBarItem = tabFouBarItem4
        
        let deliveryVC = UINavigationController(rootViewController: UIViewController())
        let tabFiveBarItem5 = UITabBarItem(title: "",
                                           image: UIImage(systemName: "person"),
                                           tag: 5)
        deliveryVC.tabBarItem = tabFiveBarItem5
        
        self.tabBar.tintColor = UIColor(named: "errorColor")
        self.tabBar.unselectedItemTintColor = .white
        self.viewControllers = [homeVC, boardVC, suggestionMealVC, reviewVC, deliveryVC]
        self.tabBar.backgroundColor = UIColor(named: "CollectionViewColor")
    }
}
