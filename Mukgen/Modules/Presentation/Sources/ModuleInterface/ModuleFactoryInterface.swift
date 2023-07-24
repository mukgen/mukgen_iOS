import Foundation

public protocol ModuleFactoryInterface {
    func InputNameVC() -> InputNicknameViewController
    func InputIdPasswordVC() -> InputIdPasswordViewController
    
    func MainVC() -> MainViewController
    
    func TapBarVC() -> TapBarViewController
    
    func BoardVC() -> BoardMainViewController
    
    func TendiousVC() -> TendinousViewController
    
    func DeliveryVC() -> DeliveryViewController
    
    func NewMealPostVC() -> NewMealPostViewController
  
    func InputTelVC() -> InputTelViewController
}

