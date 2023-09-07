import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "MukgenKit",
    dependencies: [
        .Module.core,
        .external(name: "SnapKit"),
        .external(name: "Then"),
        .external(name: "Moya"),
        .external(name: "SwiftKeychainWrapper"),
        .external(name: "RxSwift")
    ],
    resources: ["Resources/**"]
)
