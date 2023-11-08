import ProjectDescription

public extension TargetDependency {
    struct Project {}
}

public extension TargetDependency.Project {
    static let Presentation = TargetDependency.project(target: "Presentation", path: .relativeToRoot("Projects/Presentation"))
    
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/Modules/ThirdPartyLib"))
    
    static let MukgenNetwork = TargetDependency.project(target: "MukgenNetwork", path: .relativeToRoot("Projects/Modules/MukgenNetwork"))
    
    static let MukgenKit = TargetDependency.project(target: "MukgenKit", path: .relativeToRoot("Projects/Modules/MukgenKit"))
    
    //service
    public static let authService = TargetDependency.project(target: "AuthService", path: .relativeToRoot("Projects/Service/AuthService"))
    public static let boardService = TargetDependency.project(target: "BoardService", path: .relativeToRoot("Projects/Service/BoardService"))
    public static let deliveryService = TargetDependency.project(target: "DeliveryService", path: .relativeToRoot("Projects/Service/DeliveryService"))
    public static let mealSaggestionService = TargetDependency.project(target: "MealSaggestionService", path: .relativeToRoot("Projects/Service/MealSaggestionService"))
    public static let mealService = TargetDependency.project(target: "MealService", path: .relativeToRoot("Projects/Service/MealService"))
    public static let reViewService = TargetDependency.project(target: "ReViewService", path: .relativeToRoot("Projects/Service/ReViewService"))
    public static let userService = TargetDependency.project(target: "UserService", path: .relativeToRoot("Projects/Service/UserService"))
}
