//
//  DeliveryViewController.swift
//  Presentation
//
//  Created by 박준하 on 2023/06/09.
//

import UIKit

class DeliveryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemCyan
        } else {
            // Fallback on earlier versions
            view.backgroundColor = .gray
        }
    }
}
