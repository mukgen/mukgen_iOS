import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "MukgenKit",
    dependencies: [
        .Module.thirdPartyLib,
        .external(name: "SnapKit"),
        .external(name: "Then")
    ]
)
