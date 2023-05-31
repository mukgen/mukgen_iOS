import Foundation

public protocol ModuleFactoryInterface {
    func InputNameVC() -> InputNicknameViewController
    func InputIdPasswordVC() -> InputIdPasswordViewController
    
    func MainVC() -> MainViewController
}
