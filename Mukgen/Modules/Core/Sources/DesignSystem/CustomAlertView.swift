import UIKit

open class CustomAlertView: UIView {
    let backgroundView = UIView()
    private let titleLabel = UILabel()
    private let confirmButton = UIButton()
    
    var buttonAction: (() -> Void)?
    
    public init(labelText: String, buttonLabelText: String, buttonAction: @escaping () -> Void) {
        super.init(frame: .zero)

        self.buttonAction = buttonAction

        self.frame.size = CGSize(width: 280, height: 142)

        setupUI(labelText: labelText, buttonLabelText: buttonLabelText)
        setupConstraints()
    }
    required public init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(labelText: String, buttonLabelText: String) {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .left
        titleLabel.text = labelText
        titleLabel.numberOfLines = 2

        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.setTitle(buttonLabelText, for: .normal)
        confirmButton.backgroundColor = .orange
        confirmButton.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        confirmButton.layer.cornerRadius = 7.12

        self.backgroundColor = .clear
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 7.12
    }
    private func setupConstraints(){
        insertSubview(backgroundView, at: 0)

        addSubview(titleLabel)
        addSubview(confirmButton)
        backgroundView.snp.makeConstraints {
            $0.width.equalTo(280.0)
            $0.height.equalTo(142.0)
            $0.centerX.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14.0)
            $0.leading.equalTo(backgroundView.snp.leading).inset(14.0)
        }

        confirmButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.equalTo(250.0)
            $0.height.equalTo(41.0)
        }
    }
    
    @objc fileprivate func closeAlert() {
        removeFromSuperview ()
        if let action = buttonAction{
            action()
        }
    }
    
}
