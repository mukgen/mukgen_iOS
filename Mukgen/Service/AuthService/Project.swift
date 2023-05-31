import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "AuthService",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib
    ]
)
