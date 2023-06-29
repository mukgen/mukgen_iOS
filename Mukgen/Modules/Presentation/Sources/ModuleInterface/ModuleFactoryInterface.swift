import Foundation

public protocol ModuleFactoryInterface {
    func InputNameVC() -> InputNicknameViewController
    func InputIdPasswordVC() -> InputIdPasswordViewController
    
    func MainVC() -> MainViewController
    
    func TapBarVC() -> TapBarViewController
    
    func BoardVC() -> BoardMainViewController
    
    func TendiousVC() -> TendinousViewController
    
    func NewMealPostVC() -> NewMealPostViewController
  
}

