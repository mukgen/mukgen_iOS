import UIKit
import Then
import SnapKit
import MukgenKit

public class TapBarViewController : UITabBarController {
    
    public var factory: ModuleFactoryInterface!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: MainViewController())
        let tabOneBarItem = UITabBarItem(title: "홈",
                                         image: MukgenKitAsset.Images.home.image,
                                         tag: 1)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let boardVC = UINavigationController(rootViewController: BoardMainViewController())
        let tabTwoBarItem2 = UITabBarItem(title: "게시판",
                                          image: MukgenKitAsset.Images.board.image,
                                          tag: 2)
        boardVC.tabBarItem = tabTwoBarItem2
        
        let tendinousVC = UINavigationController(rootViewController: TendinousViewController())
        let tabThrBarItem3 = UITabBarItem(title: "급식 건의",
                                          image: MukgenKitAsset.Images.suggestion.image,
                                          tag: 3)
        
        tendinousVC.tabBarItem = tabThrBarItem3
        
        let reviewVC = UINavigationController(rootViewController: ReviewController())
        let tabFouBarItem4 = UITabBarItem(title: "급식 리뷰",
                                          image: MukgenKitAsset.Images.review.image,
                                          tag: 4)
        
        reviewVC.tabBarItem = tabFouBarItem4
        
        let deliveryVC = UINavigationController(rootViewController: DeliveryViewController())
        let tabFiveBarItem5 = UITabBarItem(title: "배달 파티",
                                           image: MukgenKitAsset.Images.delivery.image,
                                           tag: 5)
        deliveryVC.tabBarItem = tabFiveBarItem5
        
        self.tabBar.tintColor = MukgenKitAsset.Colors.pointBase.color
        self.tabBar.unselectedItemTintColor = MukgenKitAsset.Colors.primaryLight1.color
        self.viewControllers = [homeVC, boardVC, tendinousVC, reviewVC, deliveryVC]
        self.tabBar.backgroundColor = .white

        
    }
    

    
//    @objc func shareVCDidTap(_ sender: Any) {
//        self.navigationController?.popToViewController(UIViewController: BoardMainViewcontroller(), animated: true)
//    }
}
