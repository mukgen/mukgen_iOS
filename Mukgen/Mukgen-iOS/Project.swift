import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.app(
    name: "Mukgen-iOS",
    dependencies: [
        .Module.presentation,
        .Module.thirdPartyLib,
        .Module.mukgenKit,
        .external(name: "SnapKit"),
        .external(name: "Then")
    ],
    resources: .default
)
