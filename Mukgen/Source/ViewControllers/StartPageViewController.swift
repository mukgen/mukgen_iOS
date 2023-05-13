//
//  ViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/04/18.
//

import UIKit
import SnapKit
import Then

class StartPageViewController: UIViewController {
    
    var startButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .pointLight1
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(self, action: #selector(StartButtonDidTap), for: .touchUpInside)
        
    }
    
    var loginButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .primaryLight3
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
    }
    
    var whiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    var mukgenLogo = UIImageView().then {
        $0.image = UIImage(named: "MukgenIcon")
    }
    
  
    
    override func viewDidLoad() {
            super.viewDidLoad()
            

            view.addSubview(whiteBox)
            view.addSubview(startButton)
            view.addSubview(loginButton)
            view.addSubview(mukgenLogo)
            
            view.backgroundColor = .primaryLight3
            
            let buttonWidth = 353
            let buttonHight = 55
            
            mukgenLogo.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(272)
                $0.width.equalTo(160)
                $0.height.equalTo(189)
            }
            whiteBox.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.height.equalTo(192)
                $0.centerX.equalToSuperview()
                $0.bottom.equalToSuperview()
            }

            startButton.snp.makeConstraints {
                $0.centerX.equalTo(whiteBox.snp.centerX)
                $0.top.equalTo(whiteBox.snp.top).offset(24)
                $0.width.equalTo(buttonWidth)
                $0.height.equalTo(buttonHight)
            }
            
            loginButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(startButton.snp.bottom).offset(24)
                $0.width.equalTo(buttonWidth)
                $0.height.equalTo(buttonHight)
            }
            
                
        }
    
    @objc func StartButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(StartMukgenViewController(), animated: true)
    }
    

}
