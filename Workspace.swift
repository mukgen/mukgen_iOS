//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by inforex on 2022/10/12.
//

import ProjectDescription

let workspace = Workspace(
    name: "Mukgen-iOS",
    projects: [
        "Mukgen/Mukgen-iOS",
        "Mukgen/MukgenKit",
        "Mukgen/Presentation",
        "Mukgen/Service/AuthService",
        "Mukgen/Service/BoardService",
        "Mukgen/Service/DeliveryService",
        "Mukgen/Service/MealSaggestionService",
        "Mukgen/Service/MealService",
        "Mukgen/Service/ReViewService",
        "Mukgen/Service/UserService",
        "Mukgen/ThirdPartyLib"
    ]
)
