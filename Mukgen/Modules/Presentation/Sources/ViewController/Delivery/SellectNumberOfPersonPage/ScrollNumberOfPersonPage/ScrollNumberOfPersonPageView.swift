import UIKit
import Then
import SnapKit

class ScrollNumberOfPersonPageView: UIView {
    private let data = ["1", "2", "3", "4", "5"]
    
    
    private final var controller: UIViewController
    
    private lazy var pickerView: UIPickerView = {
            let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        pickerView.showsLargeContentViewer = true
        pickerView.showsSelectionIndicator = true
            
            // UIPickerView의 데이터 및 델리게이트 설정
        pickerView.delegate = self
        pickerView.dataSource = self
            
            return pickerView
        }()
        
        init(frame: CGRect, viewController: UIViewController) {
            self.controller = viewController
            super.init(frame: frame)
            
            layout()
            pickerView.reloadAllComponents()
        }
        
        func layout() {
            self.addSubview(pickerView)
            
            pickerView.snp.makeConstraints {
                $0.height.equalTo(216.0) // 필요한 높이를 지정
                $0.top.leading.trailing.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ScrollNumberOfPersonPageView: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerView의 컴포넌트 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerView의 행 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count // 데이터 배열의 항목 수를 반환하도록 수정해야합니다.
    }
    
    // UIPickerView의 각 행에 대한 표시 제목
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row] // 데이터 배열에서 적절한 항목을 반환하도록 수정해야합니다.
    }
    
    // 사용자가 UIPickerView에서 행을 선택했을 때 호출됨
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 선택된 행 처리
    }
}
