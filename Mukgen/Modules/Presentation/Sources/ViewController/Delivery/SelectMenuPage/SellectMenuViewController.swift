import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class SellectMenuViewController: BaseVC {
    
    
    
    public var factory: ModuleFactoryInterface!
    
    private let attributes = [NSAttributedString.Key.foregroundColor: PresentationAsset.Colors.primaryLight2.color,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    private let sellectMenuText = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "어떤 음식을\n배달 시키시나요?"
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let pageCount = UILabel().then {
        $0.text = "1 / 4"
        $0.textColor = PresentationAsset.Colors.primaryLight2.color
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }

    private var firstTextField = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var nicknameLine = UIView().then {
        $0.backgroundColor = PresentationAsset.Colors.primaryLight2.color
    }
    
    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: PresentationAsset.Colors.pointBase.color, titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap(_:)), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            sellectMenuText,
            pageCount,
            firstTextField,
            nicknameLine,
            nextPageButton
        ].forEach { view.addSubview($0) }

        
        sellectMenuText.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(172)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        pageCount.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(124)
            $0.right.equalToSuperview().inset(20)
        }
        
        firstTextField.snp.makeConstraints() {
            $0.top.equalTo(sellectMenuText.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        nicknameLine.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(0)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(352)
            $0.height.equalTo(2)
        }
        
        nextPageButton.snp.makeConstraints() {
            $0.top.equalTo(firstTextField.snp.bottom).offset(447)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false // 뷰 컨트롤러가 사라질 때 나타내기
    }

    
    public override func attribute() {
        
        view.backgroundColor = .white
        
        lazy var textFields = [firstTextField]
        let placeholders = "음식 이름"
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders,
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
    }
    
    private func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    @objc func nextPageButtonDidTap(_ sender: UIButton) {
            self.navigationController?.pushViewController(SellectNumberOfPersonMainViewController(), animated: true)
    }

}

extension SellectMenuViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField:
            animate(line: nicknameLine)
            nicknameLine.backgroundColor = PresentationAsset.Colors.pointBase.color
        default: return
        }
    }
}
