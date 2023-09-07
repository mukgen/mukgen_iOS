import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "Mukgen-iOS",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.mukgenKit,
        .Project.authService,
        .Project.boardService,
        .Project.deliveryService,
        .Project.mealService,
        .Project.mealSaggestionService,
        .Project.reViewService,
        .Project.userService,
        .Project.presentation
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
