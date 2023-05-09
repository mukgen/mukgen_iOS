//
//  ViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/04/18.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var StartButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor.gray
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    var LoginButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor.lightGray
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
    
    var WhiteBox = UILabel().then {
        $0.backgroundColor = .white
    }
    
    let MukgenLogo: UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .systemGray6
        aImageView.image = UIImage(named: "StartImage")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    let MukgenTitle: UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .systemGray6
        aImageView.image = UIImage(named: "MukgenTitle")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MukgenLogo)
        view.addSubview(MukgenTitle)
        view.addSubview(WhiteBox)
        view.addSubview(StartButton)
        view.addSubview(LoginButton)
        
        view.backgroundColor = .systemGray6
        
        //UIColor.withAlphaComponent(F5F6F6)
        
        MukgenLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(272)
            $0.width.height.equalTo(160)
        }
            
        MukgenTitle.snp.makeConstraints {
            $0.width.equalTo(101)
            $0.height.equalTo(29)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(432)
        }
        
        WhiteBox.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(192)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(660)
        }
        
        StartButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(684)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
        
        LoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(763)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
        
            
    }
}
    
