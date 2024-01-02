import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

open class MukgenTextField: UITextField {
    
    private let disposeBag = DisposeBag()
    public var initPlaceHolder: String = ""
    private let placeholderLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
    }
    
    private let underLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .red
        $0.isHidden = true
    }
    
    private let showHideButton = UIButton().then {
        $0.setImage(MukgenKitAsset.Assets.eye.image, for: .normal)
        $0.setImage(MukgenKitAsset.Assets.colorEye.image, for: .selected)
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
    }
    
    public convenience init(placeholder: MukgenTextFieldType.Placeholder.Message) {
        self.init(frame: .zero)
        
        self.tintColor = .black
        self.initPlaceHolder = placeholder.message!
        placeholderLabel.text = placeholder.message
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        delegate = self
        
        addSubview(placeholderLabel)
        addSubview(underlineView)
        addSubview(showHideButton)
        addSubview(underLabel)
        
        placeholderLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(underlineView.snp.top).offset(-4)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        underlineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        underLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underlineView.snp.bottom).offset(4)
        }
        
        if useShowHideButton {
            addSubview(showHideButton)
            showHideButton.snp.makeConstraints {
                $0.trailing.equalToSuperview()
                $0.centerY.equalToSuperview()
                $0.width.height.equalTo(20)
            }
            
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            rightViewMode = .always
        } else {
            rightView = nil
            rightViewMode = .never
        }
    }
    
    private func togglePasswordVisibility() {
        isTextHidden.toggle()
        print("asdf")
    }
    
    
    public var underMessage: String? {
        didSet {
            underLabel.text = underMessage
        }
    }
    
    public var showError: Bool = false {
        didSet {
            underLabel.isHidden = !showError
            underlineView.backgroundColor = showError ? UIColor.red : MukgenKitAsset.Colors.pointBase.color
        }
    }
    
    public var showInfo: Bool = false {
        didSet {
            underLabel.isHidden = !showInfo
            underLabel.textColor = MukgenKitAsset.Colors.primaryLight2.color
        }
    }
    
    public var showSuccess: Bool = false {
        didSet {
            underLabel.isHidden = !showInfo
            underLabel.textColor = .green
        }
    }
    
    public var showUnderLabel: Bool = false {
        didSet {
            underLabel.isHidden = !showUnderLabel
        }
    }
    
    public var useShowHideButton: Bool = true {
        didSet {
            showHideButton.isHidden = !useShowHideButton
        }
    }
    
    public var isTextHidden: Bool = false {
        didSet {
            if isSecureTextEntry && !isTextHidden {
                showHideButton.isSelected = true
                isSecureTextEntry = false
            } else if isTextHidden {
                isSecureTextEntry = true
                showHideButton.isSelected = false
            }
        }
    }
    
    public var errorType: MukgenTextFieldType.UnderLabelType.Error? {
        didSet {
            if let type = errorType {
                underMessage = type.message
                showError = type.showError
            }
        }
    }
    
    public var infoType: MukgenTextFieldType.UnderLabelType.Info? {
        didSet {
            if let type = infoType {
                underMessage = type.message
                showInfo = type.showInfo
            }
        }
    }
    
    public var successType: MukgenTextFieldType.UnderLabelType.Success? {
        didSet {
            if let type = successType {
                underMessage = type.message
                showSuccess = type.showSuccess
            }
        }
    }
    
}

extension MukgenTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.underlineView.backgroundColor = MukgenKitAsset.Colors.pointBase.color
            self.placeholderLabel.text = ""
        }
        self.layoutIfNeeded()
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            UIView.animate(withDuration: 0.3) {
                self.underlineView.backgroundColor = MukgenKitAsset.Colors.primaryLight2.color
                self.placeholderLabel.text = self.initPlaceHolder
            }
            self.layoutIfNeeded()
        }
    }
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: self)
            if showHideButton.frame.contains(location) {
                togglePasswordVisibility()
            }
        }
    }
}
