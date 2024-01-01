import Foundation
import UIKit

public enum MukgenButtonType: String, RawRepresentable {
    case loginTitle1
    case loginTitle2
    case startTitle
    case nextTitle1
    case nextTitle2
    case completeTitle
    case registTitle
    case recruitTitle
    case backTitle
    case beforeTitle
    
    public var logoTitle: String? {
        switch self {
        case .loginTitle1:
            return "로그인"
        case .loginTitle2:
            return "로그인"
        case .startTitle:
            return "시작하기"
        case .nextTitle1:
            return "다음"
        case .nextTitle2:
            return "다음"
        case .completeTitle:
            return "완료"
        case .registTitle:
            return "등록하기"
        case .recruitTitle:
            return "모집하기"
        case .backTitle:
            return "뒤로"
        case .beforeTitle:
            return "이전"
        }
    }
    
    public var titleColor: UIColor? {
        switch self {
        case .loginTitle1:
            return .black
        case .loginTitle2:
            return .white
        case .startTitle:
            return .white
        case .nextTitle1:
            return .white
        case .nextTitle2:
            return .white
        case .completeTitle:
            return .white
        case .registTitle:
            return .white
        case .recruitTitle:
            return .white
        case .backTitle:
            return .black
        case .beforeTitle:
            return MukgenKitAsset.Colors.pointBase.color
        }
    }
    
    public var backgroundColor: UIColor? {
        switch self {
        case .loginTitle1:
            return MukgenKitAsset.Colors.primaryLight3.color
        case .loginTitle2:
            return MukgenKitAsset.Colors.primaryLight2.color
        case .startTitle:
            return MukgenKitAsset.Colors.primaryBase.color
        case .nextTitle1:
            return MukgenKitAsset.Colors.primaryLight2.color
        case .nextTitle2:
            return MukgenKitAsset.Colors.pointBase.color
        case .completeTitle:
            return MukgenKitAsset.Colors.primaryLight2.color
        case .registTitle:
            return MukgenKitAsset.Colors.primaryLight2.color
        case .recruitTitle:
            return MukgenKitAsset.Colors.primaryLight2.color
        case .backTitle:
            return MukgenKitAsset.Colors.primaryLight3.color
        case .beforeTitle:
            return MukgenKitAsset.Colors.primaryLight3.color
        }
    }
    
    public var borderColor: UIColor? {
        switch self {
        case .loginTitle1:
            return .clear
        case .loginTitle2:
            return .clear
        case .startTitle:
            return .clear
        case .nextTitle1:
            return .clear
        case .nextTitle2:
            return .clear
        case .completeTitle:
            return .clear
        case .registTitle:
            return .clear
        case .recruitTitle:
            return .clear
        case .backTitle:
            return .clear
        case .beforeTitle:
            return MukgenKitAsset.Colors.pointBase.color
        }
    }
}

