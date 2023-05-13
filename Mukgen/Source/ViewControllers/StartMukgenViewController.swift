//
//  StartMukgenViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/12.
//

import UIKit
import SnapKit
import Then

class StartMukgenViewController: UIViewController {
    
    let startButton = CustomButton(title: "시작하기",backgroundColor: .primaryDark1,font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    var startLabel = UILabel().then {
        $0.text = "시작하기"
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    var mukgenInfo = UILabel().then {
        $0.text = "먹젠과 함께 학교에서 즐거운 식생활을 누려보세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    var mukgenStartIcon = UIImageView().then {
        $0.image = UIImage(named: "StartMukgenIcon")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        view.addSubview(startButton)
        view.addSubview(startLabel)
        view.addSubview(mukgenInfo)
        view.addSubview(mukgenStartIcon)
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom).inset(34)
            $0.width.equalTo(353)
            $0.height.equalTo(55)
        }
        
        startLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(123)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.width.equalTo(83)
            $0.height.equalTo(29)
        }
        
        mukgenInfo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(176)
            $0.left.equalTo(view.snp.left).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        mukgenStartIcon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(346)
            $0.width.height.equalTo(160)
        }
        
    }
    
    
}
