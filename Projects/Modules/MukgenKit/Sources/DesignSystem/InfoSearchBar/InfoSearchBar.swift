import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import Core
import INetwork

public class InfoSearchBar: UISearchBar {
    public var customPlaceholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    public var placeholderFont: UIFont? {
        didSet {
            updatePlaceholderFont()
        }
    }
    
    public var placeholderFontSize: CGFloat = 14.0 {
        didSet {
            updatePlaceholderFont()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBarStyle = .minimal
        layer.cornerRadius = bounds.height / 2.0
        layer.masksToBounds = true
        layer.borderColor = INFOKitAsset.Colors.mainColor.color.cgColor
        layer.borderWidth = 1.0
        
        let searchIcon = UIImage(systemName: "magnifyingglass")?.withTintColor(INFOKitAsset.Colors.mainColor.color, renderingMode: .alwaysOriginal)
        setImage(searchIcon, for: .search, state: .normal)
        
        if let textField = value(forKey: "searchField") as? UITextField {
            textField.textColor = .black
            textField.backgroundColor = .clear
            textField.font = .systemFont(ofSize: 14.0, weight: .medium)
            
            if let backgroundView = textField.subviews.first {
                backgroundView.subviews.forEach { subview in
                    subview.removeFromSuperview()
                }
            }
        }
        
        if let cancelButton = value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(INFOKitAsset.Colors.mainColor.color, for: .normal)
        }
        
        updatePlaceholder()
        updatePlaceholderFont()
    }
    
    private func updatePlaceholder() {
        if let textField = value(forKey: "searchField") as? UITextField {
            textField.placeholder = customPlaceholder
        }
    }
    
    private func updatePlaceholderFont() {
        if let textField = value(forKey: "searchField") as? UITextField {
            if let placeholderFont = placeholderFont {
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: placeholderFont,
                    .foregroundColor: INFOKitAsset.Colors.thinGrayColor.color
                ]
                textField.attributedPlaceholder = NSAttributedString(string: customPlaceholder ?? "", attributes: attributes)
            } else {
                textField.attributedPlaceholder = nil
                textField.placeholder = customPlaceholder
            }
        }
    }
}
