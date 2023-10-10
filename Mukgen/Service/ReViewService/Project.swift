import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ReViewService",
    product: .staticFramework,
    dependencies: [
        .Project.thirdPartyLib
    ]
)
