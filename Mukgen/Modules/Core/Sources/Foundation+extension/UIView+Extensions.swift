//
//  Extensions+UIView.swift
//  Core
//
//  Created by 박준하 on 2023/05/18.
//  Copyright © 2023 INFO-iOS. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func addSubviews(_ viewsToAdd: [UIView]) {
        viewsToAdd.forEach({addSubview($0)})
    }
}
