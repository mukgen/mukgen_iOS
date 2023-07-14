import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "Presentation",
    dependencies: [
        .Module.mukgenKit,
        .Module.authService,
        .Module.boardService,
        .Module.deliveryService,
        .Module.mealService,
        .Module.mealSaggestionService,
        .Module.reViewService,
        .Module.userService,
        .external(name: "SnapKit"),
        .external(name: "Then")
    ],
    resources: .none
)
