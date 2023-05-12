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
    
    var StartButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .StartColor
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(StartPageViewController.self, action: #selector(StartButtonDidTap), for: .touchUpInside)
        
    }
    
    var LoginButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .LoginColor
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
    }
    
    var WhiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    var MukgenLogo = UIImageView().then {
        $0.image = UIImage(named: "StartPageImage")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.addSubview(WhiteBox)
        view.addSubview(StartButton)
        view.addSubview(LoginButton)
        view.addSubview(MukgenLogo)
        
        view.backgroundColor = .StartBackgroundColor
        
        
        MukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(272)
            $0.width.equalTo(160)
            $0.height.equalTo(189)
        }
        WhiteBox.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(192)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(660)
        }

        StartButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(763)
            $0.width.equalTo(353)
            $0.height.equalTo(55)        }
        
        LoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(684)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
        
            
    }
    
    @objc func StartButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(StartViewControllers(), animated: true)
    }

}



