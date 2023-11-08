import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MukgenKit",
    product: .staticFramework,
    dependencies: [
        .Project.Core
    ],
    resources: ["Resources/**"]
)
