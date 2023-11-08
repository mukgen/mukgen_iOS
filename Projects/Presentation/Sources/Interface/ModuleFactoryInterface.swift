import Foundation

public protocol ModuleFactoryInterface {
    func loginVC() -> LoginViewController
    func signupVC() -> SignupViewController
    func tabBarVC() -> TapBarViewController
    func companyListVC() -> CompanyListViewController
}
