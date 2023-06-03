import UIKit
import Then
import SnapKit

public class TapBarViewController : UITabBarController {
    
    public var factory: ModuleFactoryInterface!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: MainViewController())
        let tabOneBarItem = UITabBarItem(title: "홈",
                                         image: PresentationAsset.Images.home.image,
                                         tag: 1)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let chartVC = UINavigationController(rootViewController: MainViewController())
        let tabTwoBarItem2 = UITabBarItem(title: "게시판",
                                          image: PresentationAsset.Images.board.image,
                                          tag: 2)
        
        chartVC.tabBarItem = tabTwoBarItem2
        
        let searchVC = UINavigationController(rootViewController: MainViewController())
        let tabThrBarItem3 = UITabBarItem(title: "급식 건의",
                                          image: PresentationAsset.Images.suggestion.image,
                                          tag: 3)
        
        searchVC.tabBarItem = tabThrBarItem3
        
        let shopVC = UINavigationController(rootViewController: MainViewController())
        let tabFouBarItem4 = UITabBarItem(title: "급식 리뷰",
                                          image: PresentationAsset.Images.review.image,
                                          tag: 4)
        
        shopVC.tabBarItem = tabFouBarItem4
        
        let userVC = UINavigationController(rootViewController: MainViewController())
        let tabFiveBarItem5 = UITabBarItem(title: "배달 파티",
                                           image: PresentationAsset.Images.delivery.image,
                                           tag: 5)
        userVC.tabBarItem = tabFiveBarItem5
        
        self.tabBar.tintColor = PresentationAsset.Colors.pointBase.color
        self.tabBar.unselectedItemTintColor = PresentationAsset.Colors.primaryLight1.color
        self.viewControllers = [homeVC, chartVC, searchVC, shopVC, userVC]
        self.tabBar.backgroundColor = .white
    }
}
