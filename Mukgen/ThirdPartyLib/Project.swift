//
//  Projects.swift
//  ProjectDescriptionHelpers
//
//  Created by inforex on 2022/10/12.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "ThirdPartyLib",
    dependencies: [
//        .SPM.Then,
//        .SPM.Kingfisher,
//        .SPM.SnapKit
        .external(name: "SnapKit"),
        .external(name: "Then")
    ]
)
