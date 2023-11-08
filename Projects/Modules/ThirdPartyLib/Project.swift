import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [],
    dependencies: [
        .SPM.SnapKit,
        .SPM.Kingfisher,
        .SPM.Then,
        .SPM.Moya,
        .SPM.RxBlocking,
        .SPM.RxCocoa,
        .SPM.RxSwift,
        .SPM.RxMoya
    ]
)
