import UIKit
import SnapKit
import Then

open class MukgenTitleLabel: UIView{
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        $0.textAlignment = .left
        $0.backgroundColor = .clear
    }
    
    private let subTitleLabel = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryDark1.color
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.backgroundColor = .clear
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    public init (
        type: MukgenTitleLabelType
    ) {
        super.init(frame: .zero)
        
        titleLabel.text = type.title
        subTitleLabel.text = type.subTitle
        titleLabel.numberOfLines = type.titleNuberOfLine ?? 1
        
        setupUI(type: type, numberOfLines: type.titleNuberOfLine ?? 1)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(type: MukgenTitleLabelType, numberOfLines: Int) {
        switch numberOfLines {
        case 1:
            titleLabel.snp.makeConstraints {
                $0.height.equalTo(29.0)
            }
        case 2:
            titleLabel.snp.makeConstraints {
                $0.height.equalTo(58.0)
            }
        default:
            break
        }
        
        if type.subTitle == nil {
            addSubview(titleLabel)

            titleLabel.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        } else if type == MukgenTitleLabelType.startTitle {
            addSubviews([titleLabel, subTitleLabel])
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.top.equalToSuperview()
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.top.equalTo(titleLabel.snp.bottom).offset(24.0)
            }
        } else {
            addSubviews([titleLabel, subTitleLabel])
            titleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.top.equalToSuperview()
            }
            
            subTitleLabel.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.top.equalTo(titleLabel.snp.bottom).offset(12.0)
            }
        }
    }
}

