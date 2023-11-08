import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Data",
    product: .staticFramework,
    dependencies: [
        .Project.MukgenNetwork,
        .Project.Domain
    ]
)
