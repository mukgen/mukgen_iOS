import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Presentation",
    product: .staticFramework,
    dependencies: [
        .Project.Domain,
        .Project.MukgenKit
    ],
    resources: ["Resources/**"]
)
