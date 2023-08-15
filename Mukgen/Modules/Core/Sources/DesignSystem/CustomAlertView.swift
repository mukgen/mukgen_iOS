//
//  CustomAlertView.swift
//  Core
//
//  Created by 박준하 on 2023/08/15.
//

import UIKit

open class CustomAlertView: UIView {
    private let titleLabel = UILabel()
    private let confirmButton = UIButton()
    
    var buttonAction: (() -> Void)?
    
    public init(labelText: String, buttonLabelText: String, buttonAction: @escaping () -> Void) {
        super.init(frame:.zero)
        
        self.buttonAction = buttonAction
        
        setupUI(labelText: labelText, buttonLabelText: buttonLabelText)
        setupConstraints()
    }
    
    required public init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(labelText:String,buttonLabelText:String){
        titleLabel.font = .boldSystemFont(ofSize : 20)
        titleLabel.textAlignment = .left
        titleLabel.text = labelText
        titleLabel.numberOfLines = 2
        
        confirmButton.setTitleColor(.white , for:.normal )
        confirmButton.setTitle(buttonLabelText , for:.normal )
        confirmButton.backgroundColor = .orange
        confirmButton.addTarget(self , action:#selector(closeAlert ) ,for:.touchUpInside )
        
        self.backgroundColor = .red
        addSubview(titleLabel)
        addSubview(confirmButton)
        
    }
    
    private func setupConstraints(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14.0)
            $0.centerX.equalToSuperview()
        }

        confirmButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.equalTo(250.0)
            $0.height.equalTo(41.0)
        }
    }
    
    @objc fileprivate func closeAlert() {
        removeFromSuperview ()
        if let action = buttonAction{
            action ()
        }
    }
    
}
