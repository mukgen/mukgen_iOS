import Foundation
import Presentation

public class ModuleFactory {
    public static let shared = ModuleFactory()
    private init() { }
}

extension ModuleFactory: ModuleFactoryInterface {
    public func MainVC() -> Presentation.MainViewController {
        let vc = MainViewController()
        return vc
    }
    
    public func InputNameVC() -> Presentation.InputNicknameViewController {
        let vc = InputNicknameViewController()
        return vc
    }
    
    public func InputIdPasswordVC() -> Presentation.InputIdPasswordViewController {
        let vc = InputIdPasswordViewController()
        return vc
    }
}
