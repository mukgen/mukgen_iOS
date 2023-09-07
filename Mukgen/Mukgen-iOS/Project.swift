import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.app(
    name: "Mukgen-iOS",
    dependencies: [
        .Module.presentation,
        .Module.mukgenKit,
        .Module.core,
        .external(name: "SnapKit"),
        .external(name: "Then"),
        .external(name: "Moya"),
        .external(name: "SwiftKeychainWrapper"),
        .external(name: "RxSwift")
    ],
    resources: .default
)
