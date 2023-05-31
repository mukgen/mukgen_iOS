import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "ProjectDescriptionHelpers",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib
    ]
)
