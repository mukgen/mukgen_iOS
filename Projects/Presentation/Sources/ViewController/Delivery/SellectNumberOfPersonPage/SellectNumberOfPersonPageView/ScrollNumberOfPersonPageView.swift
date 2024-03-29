import UIKit
import Then
import SnapKit

class ScrollNumberOfPersonPageView: UIView {
    private let data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    
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
                $0.height.equalTo(240.0)
                $0.bottom.top.equalToSuperview()
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().inset(10)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ScrollNumberOfPersonPageView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(data[row])")
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 56.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 353
        }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        
        let attributes: [NSAttributedString.Key: Any]
        
        switch row {
        case 0:
            attributes = [
                .font: UIFont.systemFont(ofSize: 20.0, weight: .semibold)
            ]
        default:
            attributes = [
                .font: UIFont.systemFont(ofSize: 20.0, weight: .semibold)
            ]
        }
        
        let title = titles[row]
        
        return NSAttributedString(string: title, attributes: attributes)
    }
}
