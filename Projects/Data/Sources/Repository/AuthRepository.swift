////
////  AuthRepository.swift
////  Data
////
////  Created by 박준하 on 2023/06/19.
////  Copyright © 2023 INFO-iOS. All rights reserved.
////
//
//import Foundation
//import RxSwift
//import RxMoya
//import INetwork
//import Domain
//
//class DefaultAuthRepository: AuthRepository {
//    private let authService: AuthService
//
//    init(authService: AuthService) {
//        self.authService = authService
//    }
//
//    func login(username: String, password: String, completion: @escaping (Result<AuthEntities, Error>) -> Void) {
//        authService.login(email: , username: username, password: password) { result in
//            switch result {
//            case .success(let user):
//                completion(.success(user))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func sendCode(email: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        authService.sendCode(email: email) { result in
//            switch result {
//            case .success:
//                completion(.success(()))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func checkCode(code: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        authService.checkCode(code: code) { result in
//            switch result {
//            case .success:
//                completion(.success(()))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func signUp(username: String, password: String, email: String, completion: @escaping (Result<User, Error>) -> Void) {
//        authService.signUp(username: username, password: password, email: email) { result in
//            switch result {
//            case .success(let user):
//                completion(.success(user))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
