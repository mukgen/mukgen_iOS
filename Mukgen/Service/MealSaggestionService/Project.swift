import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "MealSaggestionService",
    product: .staticFramework,
    dependencies: [
        .Project.core
    ]
)
