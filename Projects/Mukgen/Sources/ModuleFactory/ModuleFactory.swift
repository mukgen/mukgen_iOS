import Foundation
import Presentation

public class ModuleFactory {
    public static let shared = ModuleFactory()
    private init() { }
}

extension ModuleFactory: ModuleFactoryInterface {
    
    public func loginVC() -> Presentation.LoginViewController {
        let loginVC = LoginViewController()
        
        return loginVC
    }
    
    public func signupVC() -> Presentation.SignupViewController {
        let signupVC = SignupViewController()
        
        return signupVC
    }
    
    public func tabBarVC() -> TapBarViewController {
        let tabbarVC = TapBarViewController()
        
        return tabbarVC
    }
    
    public func companyListVC() -> CompanyListViewController {
        let companyListVC = CompanyListViewController()
        
        return companyListVC
    }
}
