//
//  InfoPlist.swift
//  UtilityPlugin
//
//  Created by inforex on 2022/10/14.
//

import Foundation
import ProjectDescription

public extension ProjectDescription.InfoPlist {

    static let `defaultFile`: ProjectDescription.InfoPlist = .file(path: .relativeToRoot("Support/Info.plist"))
}
