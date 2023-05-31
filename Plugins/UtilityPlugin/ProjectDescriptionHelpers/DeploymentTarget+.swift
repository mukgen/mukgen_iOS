//
//  DeploymentTarget+.swift
//  UtilityPlugin
//
//  Created by inforex on 2022/10/14.
//

import Foundation
import ProjectDescription

public extension ProjectDescription.DeploymentTarget {

    static let `defaultTarget`: ProjectDescription.DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .ipad])
}
