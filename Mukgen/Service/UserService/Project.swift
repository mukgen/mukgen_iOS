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
