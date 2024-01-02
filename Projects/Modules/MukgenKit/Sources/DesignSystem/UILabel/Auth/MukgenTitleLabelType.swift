import Foundation
import UIKit

public enum MukgenTitleLabelType: String, RawRepresentable {
    case loginTitle
    case startTitle
    case emailTitle
    case idPwTitle
    case telTitle
    case checkTitle
    case nicknameTitle

    public var title: String? {
        switch self {
        case .loginTitle:
            return "로그인을 위한\n정보를 입력해주세요."
        case .startTitle:
            return "시작하기"
        case .emailTitle:
            return "이메일 인증을 진행해주세요."
        case .checkTitle:
            return "인증번호를 입력해주세요."
        case .idPwTitle:
            return "아이디와\n비밀번호를 입력해주세요."
        case .telTitle:
            return "전화번호를 입력해주세요."
        case .nicknameTitle:
            return "별명을 입력해주세요."
        }
    }

    public var subTitle: String? {
        switch self {
        case .startTitle:
            return "먹젠과 함께 학교에서 즐거운 식생활을 누려보세요."
        case .emailTitle:
            return "입력한 이메일로 인증번호가 전송됩니다."
        case .checkTitle:
            return " 로 메일이 전송되었습니다."
        case .idPwTitle:
            return nil
        case .telTitle:
            return "배달 파티 모집 시 사용됩니다."
        case .nicknameTitle:
            return nil
        case .loginTitle:
            return nil
        }
    }
    
    public var titleNuberOfLine: Int? {
        switch self {
        case .loginTitle:
            return 2
        case .startTitle:
            return 1
        case .emailTitle:
            return 1
        case .checkTitle:
            return 1
        case .idPwTitle:
            return 2
        case .telTitle:
            return 1
        case .nicknameTitle:
            return 1
        }
    }
}

