//
//  ViewController.swift
//  Mukgen
//
//  Created by 이은호 on 2023/04/18.
//

import UIKit

class ViewController: UIViewController {
    
    let button = CustomButton(title: "시작하기",
                              backgroundColor: .primaryDark1,
                              font: UIFont.systemFont(ofSize: 20, weight: .bold)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .pointBase
        // Do any additional setup after loading the view.
        
        button.center = view.center
        view.addSubview(button)
    }
}
