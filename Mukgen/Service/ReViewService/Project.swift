import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ReViewService",
    product: .staticFramework,
    dependencies: [
        .Project.thirdPartyLib,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Moya,
        .SPM.RxCocoa,
        .SPM.RxMoya,
        .SPM.RxSwift,
        .SPM.RxRelay
    ]
)
