import UIKit
import SnapKit
import Then
import MukgenKit
import Core

public class InputEmailViewController: BaseVC {
    public var factory: ModuleFactoryInterface!
    
    private let progressEmailLabel = UILabel().then {
        $0.text = "이메일 인증을 진행해주세요."
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let guideInputEmail = UILabel().then {
        $0.text = "입력한 이메일로 인증번호가 전송됩니다."
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private var inputEmailTF = CustomTextField().then {
        $0.tintColor = .black
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    private var underLine = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }

    private let nextPageButton = CustomButton(title: "다음",
                                              backgroundColor: MukgenKitAsset.Colors.primaryLight2.color, titleColor: UIColor.white,
                                   font: UIFont.systemFont(ofSize: 16, weight: .semibold)
    ).then {
       // $0.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
    }
    
    public override func layout() {
        [
            progressEmailLabel,
            guideInputEmail,
            inputEmailTF,
            nextPageButton
        ].forEach { view.addSubview($0) }
        
        
        progressEmailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        guideInputEmail.snp.makeConstraints {
            $0.top.equalTo(progressEmailLabel.snp.bottom).offset(12.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        inputEmailTF.snp.makeConstraints {
            $0.top.equalTo(guideInputEmail.snp.bottom).offset(24)
        }
    }
    
    public override func attribute() {
        <#code#>
    }
    
    
    private func updateButtonColor() {
        if firstTextField.text?.isEmpty == false, firstTextField.text!.count <= 8 {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.pointBase.color
            }
        } else {
            DispatchQueue.main.async {
                self.nextPageButton.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
            }
        }
    }
 }
