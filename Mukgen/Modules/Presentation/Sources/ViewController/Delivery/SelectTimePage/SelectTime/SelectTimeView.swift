import UIKit
import Then
import SnapKit

class SelectTimeView: UIView {
    private let time = ["오전", "오후"]
    private let hour = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    private let minuete = ["0", "10", "20", "30", "40", "50"]
    
    
    private final var controller: UIViewController
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        pickerView.showsLargeContentViewer = true
        pickerView.delegate = self
        pickerView.dataSource = self
            
        return pickerView
    }()
    
    private let feedbackGenerator = UISelectionFeedbackGenerator()
        
        init(frame: CGRect, viewController: UIViewController) {
            self.controller = viewController
            super.init(frame: frame)
                
            layout()
            pickerView.reloadAllComponents()
        }
        
        func layout() {
            self.addSubview(pickerView)
            
            pickerView.snp.makeConstraints {
                $0.height.equalTo(305.0)
                $0.bottom.top.equalToSuperview()
                $0.top.leading.trailing.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension SelectTimeView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return time.count
        case 1:
            return hour.count
        default:
            return minuete.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(time[row])"
        case 1:
            return "\(hour[row])"
        default:
            return "\(minuete[row])"
        }
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 56.0
    }
    

}
