import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "DeliveryService",
    product: .staticFramework,
    dependencies: [
        .Project.core
    ]
)
