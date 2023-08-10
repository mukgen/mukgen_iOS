import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Core",
    dependencies: [
        .Module.thirdPartyLib,
        .external(name: "SnapKit"),
        .external(name: "Then"),
        .external(name: "Moya")
    ]
)
