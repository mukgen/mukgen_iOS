import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.framework(
    name: "DeliveryService",
    dependencies: [
        .Module.mukgenKit,
        .Module.thirdPartyLib
    ]
)
