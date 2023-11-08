import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Presentation",
    product: .staticFramework,
    dependencies: [
        .Project.authService,
        .Project.boardService,
        .Project.deliveryService,
        .Project.mealService,
        .Project.mealSaggestionService,
        .Project.reViewService,
        .Project.userService,
        .Project.MukgenKit
    ],
    resources: ["Resources/**"]
)
