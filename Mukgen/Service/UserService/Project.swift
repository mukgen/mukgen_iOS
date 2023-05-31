//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박준하 on 2023/05/31.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "UserService",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib
    ]
)
