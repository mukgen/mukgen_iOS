import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INFOKit
import INetwork
import Domain

public class SignupViewModel {

    public let authService: AuthService
    private let disposeBag = DisposeBag()

    let signupResult: PublishSubject<Result<Void, Error>> = PublishSubject()
    let sendCodeResult: PublishSubject<Result<Void, Error>> = PublishSubject()
    let checkCodeResult: PublishSubject<Result<Void, Error>> = PublishSubject()


    public init(authService: AuthService,
                gmailText: Observable<String?>,
                emailCodeText: Observable<String?>,
                studentKeyText: Observable<String?>,
                nameText: Observable<String?>,
                passwordText: Observable<String?>,
                githubLinkText: Observable<String?>) {

        self.authService = authService

        Observable.combineLatest(gmailText,
                                 emailCodeText,
                                 studentKeyText,
                                 nameText,
                                 passwordText,
                                 githubLinkText)
        .subscribe(onNext: { [weak self] (gmail, emailCode, studentKey, name, password, githubLink) in
            self?.signUp(gmail: gmail, emailCode: emailCode, studentKey: studentKey, name: name, password: password, githubLink: githubLink)
        })
        .disposed(by: disposeBag)
    }

    func sendCode(email: String) {
        authService.sendCode(email: email)
            .subscribe(onSuccess: { [weak self] in
                self?.sendCodeResult.onNext(.success(())) // 코드 전송 성공 처리 😎
            }, onError: { [weak self] error in
                self?.sendCodeResult.onNext(.failure(error)) // 코드 전송 실패 처리 🥲
            })
            .disposed(by: disposeBag)
    }

    func checkCode(email: String, data: String, type: String) {
        authService.checkCode(email: email, data: data, type: type)
            .subscribe(onSuccess: { [weak self] in
                self?.checkCodeResult.onNext(.success(()))
            }, onError: { [weak self] error in
                self?.checkCodeResult.onNext(.failure(error))
            })
            .disposed(by: disposeBag)
    }


    public func signUp(gmail: String?, emailCode: String?, studentKey: String?, name: String?, password: String?, githubLink: String?) {
        guard let emailCode = emailCode, let studentKey = studentKey, let name = name, let email = gmail, let password = password else {
            signupResult.onNext(.failure(MyError.missingFields))
            return
        }

        authService.signUp(emailCode: emailCode, studentKey: studentKey, name: name, email: email, password: password, githubLink: githubLink)
            .subscribe(onSuccess: { [weak self] in
                self?.signupResult.onNext(.success(()))
            }, onError: { [weak self] error in
                self?.signupResult.onNext(.failure(error))
            })
            .disposed(by: disposeBag)
    }
}
