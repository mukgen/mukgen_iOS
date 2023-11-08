import ProjectDescription

public extension TargetDependency {
    struct Project {}
}

public extension TargetDependency.Project {
    static let Presentation = TargetDependency.project(target: "Presentation", path: .relativeToRoot("Projects/Presentation"))
    
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    
    static let Data = TargetDependency.project(target: "Data", path: .relativeToRoot("Projects/Data"))
    
    static let Domain = TargetDependency.project(target: "Domain", path: .relativeToRoot("Projects/Domain"))
    
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/Modules/ThirdPartyLib"))
    
    static let MukgenNetwork = TargetDependency.project(target: "MukgenNetwork", path: .relativeToRoot("Projects/Modules/MukgenNetwork"))
    
    static let MukgenKit = TargetDependency.project(target: "MukgenKit", path: .relativeToRoot("Projects/Modules/MukgenKit"))
}
