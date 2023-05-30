//
//  BaseVC.swift
//  Mukgen
//
//  Created by 이은호 on 2023/05/30.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        attribute()
    }
    
    func layout() {}
    func attribute() {}
}
