import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "UserService",
    product: .staticFramework,
    dependencies: [
        .Project.thirdPartyLib
    ]
)
