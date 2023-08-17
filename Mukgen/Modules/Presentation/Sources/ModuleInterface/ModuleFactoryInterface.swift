import Foundation

public protocol ModuleFactoryInterface {
    func InputNickNameVC() -> InputNicknameViewController
    func InputIdPasswordVC() -> InputIdPasswordViewController
    
    func MainVC() -> MainViewController
    
    func TapBarVC() -> TapBarViewController
    
    func BoardVC() -> BoardMainViewController
    
    func TendiousVC() -> TendinousViewController
    
    func DeliveryVC() -> DeliveryViewController
    
    func NewMealPostVC() -> NewMealPostViewController
  
    func InputTelVC() -> InputTelViewController
    
    func StartPageVC() -> StartPageViewController
    
    func StartMukgenVC() -> StartMukgenViewController
    
    func TestLoginVC() -> TestLoginViewController
    
    func TestPickerVC() -> TestPickerViewController
    
    func InputEmailVC() -> InputEmailViewController
    
    func textAlertVC() -> TextAlertViewController
    
    func checkEmailVC() -> CheckEmailViewController
    
    func myPageVC() -> MyPageViewController
}

