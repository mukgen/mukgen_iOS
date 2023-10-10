import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "BoardService",
    product: .staticFramework,
    dependencies: [
        .Project.thirdPartyLib
    ]
)
