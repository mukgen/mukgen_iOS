import Foundation
import UIKit

public enum MukgenTextFieldType {
    
    public enum UnderLabelType {
        public enum Error {
            case wrongIdPw // 아이디 혹은 비밀번호를 확인해주세요.
            case wrongEmail
            case wrongNum// 이미 사용중인 아이디입니다. 다른 아이디를 선택해주세요
            case wrongTerm
            case alreadyTaken
            case noCheck// 아이디에 민감한 정보 포함 제한
            
            var message: String? {
                switch self {
                case .wrongIdPw:
                    return "아이디 혹은 비밀번호를 확인해주세요."
                case .wrongEmail:
                    return "잘못된 유형의 이메일 주소입니다."
                case .wrongNum:
                    return "인증번호가 일치하지 않습니다."
                case .wrongTerm:
                    return "조건에 맞지 않습니다."
                case .alreadyTaken:
                    return "이미 사용중인 아이디 입니다."
                case .noCheck:
                    return "중복 여부를 확인해 주세요."
                }
            }
            var showError: Bool {
                return true
            }
        }
        
        public enum Info {
            case nicknameLength // 별명 길이
            case idLength // 아이디 길이
            case passWordLength// 비밀번호 길이
            
            var message: String? {
                switch self {
                case .nicknameLength:
                    return "최대 8자"
                case .idLength:
                    return "최소 5자, 최대 15자"
                case .passWordLength:
                    return "특수문자 최소 1자 포함, 최대 20자"
                }
            }
            var showInfo: Bool {
                return true
            }
        }
        
        public enum Success {
            case possibleId // 사용 가능한 아이디
            case possiblePw // 사용 가능한 비밀번호
            case correctPw // 일치하는 비밀번호
            
            var message: String? {
                switch self {
                case .possibleId:
                    return "사용 가능한 아이디 입니다."
                case .possiblePw:
                    return "사용 가능한 비밀번호입니다."
                case .correctPw:
                    return "비밀번호가 일치합니다."
                }
            }
            var showSuccess: Bool {
                return true
            }
        }
    }
    
    public enum Placeholder {
        public enum Message {
            case messageId // 아이디 혹은 비밀번호를 확인해주세요.
            case messagePw
            case messageEmail// 이미 사용중인 아이디입니다. 다른 아이디를 선택해주세요
            case messageNickname
            case messageCheckPw
            case messageMenu// 아이디에 민감한 정보 포함 제한
            case messagePlace
            
            var message: String? {
                switch self {
                case .messageId:
                    return "아이디"
                case .messagePw:
                    return "비밀번호"
                case .messageEmail:
                    return "이메일 주소"
                case .messageNickname:
                    return "별명"
                case .messageCheckPw:
                    return "비밀번호 확인"
                case .messageMenu:
                    return "음식 이름"
                case .messagePlace:
                    return "장소"
                }
            }
        }
    }
}
