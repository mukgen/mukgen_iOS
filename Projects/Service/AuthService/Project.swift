import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "AuthService",
    product: .staticFramework,
    dependencies: [
        .Project.MukgenNetwork
    ]
)
