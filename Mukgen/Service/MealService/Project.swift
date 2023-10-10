import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "MealService",
    product: .staticFramework,
    dependencies: [
        .Project.core
    ]
)
