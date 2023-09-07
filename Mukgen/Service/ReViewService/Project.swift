import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "ReViewService",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib,
        .external(name: "SnapKit"),
        .external(name: "Then"),
        .external(name: "Moya"),
        .external(name: "SwiftKeychainWrapper"),
        .external(name: "RxSwift")
    ]
)
