import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "MukgenKit",
    dependencies: [
        .Module.core,
        .external(name: "SnapKit"),
        .external(name: "Then")
    ],
    resources: ["Resources/**"]
)
