import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [],
    dependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Moya,
        .SPM.RxCocoa,
        .SPM.RxMoya,
        .SPM.RxSwift
    ]
)
