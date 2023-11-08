import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Mukgen",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.Presentation
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
