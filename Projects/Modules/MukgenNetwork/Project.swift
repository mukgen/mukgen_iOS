import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MukgenNetwork",
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ]
)
