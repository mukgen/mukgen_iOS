//
//  StartMukgenViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/12.
//

import UIKit
import SnapKit
import Then

final class StartMukgenViewController: BaseViewController {
    
    private let startButton = CustomButton(title: "시작하기",
                                           backgroundColor: .primaryDark1, titleColor: .white,
                                           font: UIFont.systemFont(ofSize: 16, weight: .bold)
    ).then {
        $0.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    private let startLabel = UILabel().then {
        $0.text = "시작하기"
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let mukgenInfo = UILabel().then {
        $0.text = "먹젠과 함께 학교에서 즐거운 식생활을 누려보세요."
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private let mukgenStartIcon = UIImageView().then {
        $0.image = UIImage(named: "StartMukgenIcon")
    }
    
    override func layout() {
        
        [
            startButton,
            startLabel,
            mukgenInfo,
            mukgenStartIcon
            
        ].forEach { view.addSubview($0) }
        
        let buttonWidth = 353
        let buttonHeigh = 55
        
        startLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(123)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(29)
        }
        
        mukgenInfo.snp.makeConstraints {
            $0.top.equalTo(startLabel.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(19)
        }
        
        mukgenStartIcon.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mukgenInfo.snp.bottom).offset(151)
            $0.width.height.equalTo(160)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mukgenStartIcon.snp.bottom).offset(257)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonHeigh)
        }
    }
    
    override func attribute() {
        view.backgroundColor = .white
    }
    
    @objc func startButtonDidTap(_ sender: Any) {
        self.navigationController?.pushViewController(InputNicknameViewController(), animated: true)
    }
}

