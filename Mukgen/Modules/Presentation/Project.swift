import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Presentation",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib,
        .Module.core,
        .external(name: "SnapKit"),
        .external(name: "Then")
    ],
    resources: .default
)
