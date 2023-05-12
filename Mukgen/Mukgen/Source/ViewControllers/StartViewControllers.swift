//
//  StartViewControllers.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/12.
//

import UIKit
import SnapKit
import Then

class StartViewControllers: UIViewController {
    
    var StartPageImage = UIImageView().then {
        $0.image = UIImage(named: "StartIcon")
    }
    
    var StartLabel = UILabel().then {
        $0.text = "시작하기"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(StartPageImage)
        view.addSubview(StartLabel)
        
        nav()
        
        StartPageImage.snp.makeConstraints {
            $0.height.width.equalTo(160)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(287)
        }
        
        StartLabel.snp.makeConstraints() {
            $0.width.equalTo(83)
            $0.height.equalTo(29)
            $0.top.equalTo(view.snp.top).offset(64)
            $0.left.equalTo(view.snp.left).offset(20)
            
        }
    }
    

    
    
    func nav() {
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(GoForwardButton))
    }
    
    @objc func GoForwardButton() {
        print("fsfdsfs")
    }
}
