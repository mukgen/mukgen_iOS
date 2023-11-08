//import Foundation
//import RxSwift
//import INetwork
//
//public protocol AuthUseCase {
//    func login(email: String, password: String)
//    func sendCode(email: String)
//    func checkCode(email: String, data: String, type: String)
//    func signUp(emailCode: String, studentKey: String, name: String, email: String, password: String, githubLink: String?)
//    func reissueToken()
//    func checkTokenTime(token: String)
//    
//    var authSuccess: PublishSubject<Token> { get }
//    var authFail: PublishSubject<Error> { get }
//    var codeSent: PublishSubject<Void> { get }
//    var codeCheckSuccess: PublishSubject<Void> { get }
//    var signUpSuccess: PublishSubject<Void> { get }
//    var tokenReissued: PublishSubject<Token> { get }
//    var tokenTimeChecked: PublishSubject<Int> { get }
//}
//
//public final class DefaultAuthUseCase: AuthUseCase {
//    private let authService: AuthService
//    private let disposeBag = DisposeBag()
//    
//    public var authSuccess = PublishSubject<Token>()
//    public var authFail = PublishSubject<Error>()
//    public var codeSent = PublishSubject<Void>()
//    public var codeCheckSuccess = PublishSubject<Void>()
//    public var signUpSuccess = PublishSubject<Void>()
//    public var tokenReissued = PublishSubject<Token>()
//    public var tokenTimeChecked = PublishSubject<Int>()
//    
//    public init(authService: AuthService) {
//        self.authService = authService
//    }
//    
//    public func login(email: String, password: String) {
//        authService.login(email: email, password: password)
//            .subscribe(
//                onSuccess: { [weak self] token in
//                    self?.authSuccess.onNext(token)
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//    
//    public func sendCode(email: String) {
//        authService.sendCode(email: email)
//            .subscribe(
//                onSuccess: { [weak self] in
//                    self?.codeSent.onNext(())
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//    
//    public func checkCode(email: String, data: String, type: String) {
//        authService.checkCode(email: email, data: data, type: type)
//            .subscribe(
//                onSuccess: { [weak self] in
//                    self?.codeCheckSuccess.onNext(())
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//    
//    public func signUp(emailCode: String, studentKey: String, name: String, email: String, password: String, githubLink: String?) {
//        authService.signUp(emailCode: emailCode, studentKey: studentKey, name: name, email: email, password: password, githubLink: githubLink)
//            .subscribe(
//                onSuccess: { [weak self] in
//                    self?.signUpSuccess.onNext(())
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//    
//    public func reissueToken() {
//        authService.reissueToken()
//            .subscribe(
//                onSuccess: { [weak self] token in
//                    self?.tokenReissued.onNext(token)
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//    
//    public func checkTokenTime(token: String) {
//        authService.checkTokenTime(token: token)
//            .subscribe(
//                onSuccess: { [weak self] remainingTime in
//                    self?.tokenTimeChecked.onNext(remainingTime)
//                },
//                onFailure: { [weak self] error in
//                    self?.authFail.onNext(error)
//                }
//            )
//            .disposed(by: disposeBag)
//    }
//}
