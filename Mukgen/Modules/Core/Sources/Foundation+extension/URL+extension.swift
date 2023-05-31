//
//  URL+extension.swift
//  Core
//
//  Created by 박준하 on 2023/04/26.
//  Copyright © 2023 INFO-iOS. All rights reserved.
//

import Foundation

public extension URL {
    static var baseURL: URL {
        return URL(string: "https://api.info-dsm.info")!
    }
}
