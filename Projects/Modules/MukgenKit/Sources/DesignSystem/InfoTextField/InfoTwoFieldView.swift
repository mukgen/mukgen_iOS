import UIKit
import SnapKit
import Then
import Domain
import RxCocoa
import RxSwift
import Core

open class InfoTwoFieldView: UIView {
    
    public let titleLabel: UILabel
    public let textField1: UITextField
    public let textField2: UITextField
    public let button1: UIButton
    public let button2: UIButton
    
    public init(title: String, placeholder1: String, placeholder2: String, buttonVisible: Bool = false) {
        titleLabel = UILabel().then {
            $0.textColor = INFOKitAsset.Colors.dailyGrayColor.color
            $0.font = .systemFont(ofSize: 15.0, weight: .semibold)
            $0.text = title
        }
        
        textField1 = UITextField().then {
            $0.font = .systemFont(ofSize: 10.0, weight: .medium)
            $0.tintColor = INFOKitAsset.Colors.thinGrayColor.color
            $0.attributedPlaceholder = NSAttributedString(string: placeholder1, attributes: [NSAttributedString.Key.foregroundColor: INFOKitAsset.Colors.thinGrayColor.color])
            $0.keyboardType = .emailAddress
            $0.clearButtonMode = .whileEditing
            $0.borderStyle = .roundedRect
            $0.backgroundColor = INFOKitAsset.Colors.lightGrayColor.color
            $0.layer.cornerRadius = 4.0
        }
        
        textField2 = UITextField().then {
            $0.font = .systemFont(ofSize: 10.0, weight: .medium)
            $0.tintColor = INFOKitAsset.Colors.thinGrayColor.color
            $0.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor: INFOKitAsset.Colors.thinGrayColor.color])
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
            $0.borderStyle = .roundedRect
            $0.backgroundColor = INFOKitAsset.Colors.lightGrayColor.color
            $0.layer.cornerRadius = 4.0
        }
        
        button1 = UIButton().then {
            $0.setTitle("인증번호 발송", for: .normal)
            $0.setTitleColor(INFOKitAsset.Colors.mainColor.color, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 10.0, weight: .medium)
        }
        
        button2 = UIButton().then {
            $0.setTitle("인증 번호 확인", for: .normal)
            $0.setTitleColor(INFOKitAsset.Colors.mainColor.color, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 10.0, weight: .medium)
        }
        
        super.init(frame: .zero)
        
        setupLayout(buttonVisible: buttonVisible)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupLayout(buttonVisible: Bool) {
        addSubview(titleLabel)
        addSubview(textField1)
        addSubview(textField2)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        if buttonVisible {
            addSubview(button1)
            button1.snp.makeConstraints {
                $0.centerY.equalTo(textField1)
                $0.trailing.equalToSuperview()
                $0.width.equalTo(70.0)
                $0.height.equalTo(30.0)
            }
        }
        
        textField1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40.0)
        }
        
        if buttonVisible {
            addSubview(button1)
            
            button1.snp.makeConstraints {
                $0.centerY.equalTo(textField1)
                $0.trailing.equalToSuperview().inset(20.0)
                $0.width.equalTo(70.0)
                $0.height.equalTo(30.0)
            }
        }
        
        textField2.snp.makeConstraints {
            $0.top.equalTo(textField1.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40.0)
        }
        
        if buttonVisible {
            addSubview(button2)
            
            button2.snp.makeConstraints {
                $0.centerY.equalTo(textField2)
                $0.trailing.equalToSuperview().inset(20.0)
                $0.width.equalTo(70.0)
                $0.height.equalTo(30.0)
            }
        }
    }
}
