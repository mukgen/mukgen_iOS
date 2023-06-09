//
//  TapbarViewController.swift
//  Mukgen-iOS
//
//  Created by 박준하 on 2023/06/09.
//

import UIKit
import Then
import SnapKit
import Presentation

public class TapBarViewController : UITabBarController {
    
    
//    func tabBar(tabBar: UITabBar, didSelectItem item: ) {
//           print("ddd")
//       }
    
    public var factory: ModuleFactoryInterface!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let moduleFactory = ModuleFactory.shared

        let homeVC = UINavigationController(rootViewController: UIViewController())
        let tabOneBarItem = UITabBarItem(title: "홈",
                                         image: MukgenIOSAsset.Images.home.image,
                                         tag: 1)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let chartVC = UINavigationController(rootViewController: MainViewController())
        let tabTwoBarItem2 = UITabBarItem(title: "게시판",
                                          image: MukgenIOSAsset.Images.board.image,
                                          tag: 2)
        chartVC.tabBarItem = tabTwoBarItem2
        
        let searchVC = UINavigationController(rootViewController: MainViewController())
        let tabThrBarItem3 = UITabBarItem(title: "급식 건의",
                                          image: MukgenIOSAsset.Images.suggestion.image,
                                          tag: 3)
        
        searchVC.tabBarItem = tabThrBarItem3
        
        let shopVC = UINavigationController(rootViewController: MainViewController())
        let tabFouBarItem4 = UITabBarItem(title: "급식 리뷰",
                                          image: MukgenIOSAsset.Images.review.image,
                                          tag: 4)
        
        shopVC.tabBarItem = tabFouBarItem4
        
        let userVC = UINavigationController(rootViewController: MainViewController())
        let tabFiveBarItem5 = UITabBarItem(title: "배달 파티",
                                           image: MukgenIOSAsset.Images.delivery.image,
                                           tag: 5)
        userVC.tabBarItem = tabFiveBarItem5
        
        self.tabBar.tintColor = PresentationAsset.Colors.pointBase.color
        self.tabBar.unselectedItemTintColor = PresentationAsset.Colors.primaryLight1.color
        self.viewControllers = [homeVC, chartVC, searchVC, shopVC, userVC]
        self.tabBar.backgroundColor = .white

        
    }
    

    
//    @objc func shareVCDidTap(_ sender: Any) {
//        self.navigationController?.popToViewController(UIViewController: BoardMainViewcontroller(), animated: true)
//    }
}
