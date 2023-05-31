//
//  Projects.swift
//  ProjectDescriptionHelpers
//
//  Created by inforex on 2022/10/12.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.app(
    name: "Mukgen-iOS",
    dependencies: [
        .Module.presentation,
        .Module.thirdPartyLib,
        .Module.mukgenKit
    ],
    resources: .default
)
