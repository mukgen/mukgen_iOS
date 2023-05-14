//
//  InputNicknameViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/13.
//

//FE6B01

import UIKit
import SnapKit
import Then

class InputNicknameViewController: UIViewController {
    
    let inputNicknameLabel = UILabel().then {
        $0.text = "별명을 입력해주세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.primaryLight2,
                          .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
    
    internal var firstTextField = UITextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    internal var nicknameLine = UIView().then {
        $0.backgroundColor = .primaryLight2
    }
    
    let nextPageButton = CustomButton(title: "다음",
                                   backgroundColor: .primaryLight2,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
        $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        lazy var textFields = [firstTextField]
        let placeholders = ["별명"]
        
        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                 attributes: attributes)
            textField.delegate = self
            index += 1
        }
        
        view.addSubview(inputNicknameLabel)
        view.addSubview(firstTextField)
        view.addSubview(nicknameLine)
        view.addSubview(nextPageButton)
        
        let buttonWidth = 353
        let buttonHeigh = 55
        
        inputNicknameLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        firstTextField.snp.makeConstraints() {
            $0.top.equalTo(inputNicknameLabel.snp.bottom).offset(24)
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
            $0.top.equalTo(firstTextField.snp.bottom).offset(531)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonHeigh)
        }

    }
    
    func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    @objc func nextPageButtonDidTap(_ sender: Any) {
            self.navigationController?.pushViewController(InputIdPasswordViewController(), animated: true)
        }

}

extension InputNicknameViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case firstTextField:
            animate(line: nicknameLine)
            nicknameLine.backgroundColor = .pointBase
        default: return
        }
    }
}
