//
//  CustomAlertView.swift
//  Core
//
//  Created by 박준하 on 2023/08/15.
//

import UIKit

class CustomAlertView: UIView {
    private let titleLabel = UILabel()
    private let confirmButton = UIButton()

    var buttonAction: (() -> Void)?

    init(labelText: String, buttonLabelText: String, buttonAction: @escaping () -> Void) {
        super.init(frame:.zero)
        
        self.buttonAction = buttonAction
        
        setupUI(labelText: labelText, buttonLabelText: buttonLabelText)
        setupConstraints()
    }
    
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(labelText:String,buttonLabelText:String){
         titleLabel.font = .boldSystemFont(ofSize :20)
         titleLabel.textAlignment = .center
         titleLabel.text=labelText
        
         confirmButton.setTitleColor(.systemBlue , for:.normal )
          confirmButton.setTitle(buttonLabelText , for:.normal )
          confirmButton.addTarget(self , action:#selector(closeAlert ) ,for:.touchUpInside )
          
           addSubview(titleLabel)
           addSubview(confirmButton)

      }
      
      private func  setupConstraints(){
            // Add constraints here
       }
      
       @objc fileprivate func closeAlert() {
             removeFromSuperview ()
              if let action = buttonAction{
                     action ()
                }
       }

}
