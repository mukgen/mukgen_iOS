import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Moya = TargetDependency.external(name: "Moya")
    static let SwiftKeychainWrapper = TargetDependency.external(name: "SwiftKeychainWrapper")
    static let FlareLane = TargetDependency.external(name: "FlareLane")
}
