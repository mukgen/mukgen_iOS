import UIKit
import SnapKit
import AuthService

public class TestLoginViewController: UIViewController {
    
    public var factory: ModuleFactoryInterface!

    private let accountIdTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let getTokenButton = UIButton()

    let authService = AuthService()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        accountIdTextField.placeholder = "Account ID"
        accountIdTextField.borderStyle = .roundedRect
        view.addSubview(accountIdTextField)
        accountIdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.width.equalTo(250)
            make.height.equalTo(40)
        }

        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountIdTextField.snp.bottom).offset(20)
            make.width.equalTo(accountIdTextField)
            make.height.equalTo(accountIdTextField)
        }

        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.width.equalTo(accountIdTextField)
            make.height.equalTo(accountIdTextField)
        }
        
        view.addSubview(getTokenButton)
        
        getTokenButton.setTitle("Give Me Token!!", for: .normal)
        getTokenButton.backgroundColor = .red
        getTokenButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        getTokenButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(accountIdTextField)
            make.height.equalTo(accountIdTextField)
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let accountId = accountIdTextField.text, let password = passwordTextField.text else {
            print("Please enter Account ID and Password.")
            return
        }
        
        authService.login(accountId: accountId, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let loginResponse):
                    print("Login successful. Welcome, \(loginResponse.message)!")
                    print("accessToken: \(loginResponse.tokenResponse.accessToken)")
                    print("refreshToken: \(loginResponse.tokenResponse.refreshToken)")

                    self?.authService.setRefreshToken(token: loginResponse.tokenResponse.refreshToken)
                    
                case .failure(let error):
                    print("Login failed. Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
