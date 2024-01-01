import UIKit
import SnapKit
import Then

open class CustomTitleUILabel: UILabel {
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    
    public init (
        text: String,
        lineNumber: Int? = 1
    ) {
        super.init(frame: .zero)
        
        titleLabel.text = text
        titleLabel.numberOfLines = lineNumber ?? 1
        
        setupUI(line: lineNumber ?? 1)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(line: Int) {
        switch line {
        case 1:
            titleLabel.snp.makeConstraints {
                $0.height.equalTo(29.0)
            }
            break
        case 2:
            titleLabel.snp.makeConstraints {
                $0.height.equalTo(58.0)
            }
            break
        default:
            break
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

