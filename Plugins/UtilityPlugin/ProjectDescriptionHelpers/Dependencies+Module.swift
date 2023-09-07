import ProjectDescription


extension TargetDependency {
    public enum Project {}
}

extension TargetDependency.Project {
    public static let presentation = TargetDependency.project(target: "Presentation", path: .relativeToRoot("Mukgen/Modules/Presentation"))
    public static let mukgenKit = TargetDependency.project(target: "MukgenKit", path: .relativeToRoot("Mukgen/Modules/MukgenKit"))
    public static let thirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Mukgen/Modules/ThirdPartyLib"))
    public static let core = TargetDependency.project(target: "Core", path: .relativeToRoot("Mukgen/Modules/Core"))
    
    //service
    public static let authService = TargetDependency.project(target: "AuthService", path: .relativeToRoot("Mukgen/Service/AuthService"))
    public static let boardService = TargetDependency.project(target: "BoardService", path: .relativeToRoot("Mukgen/Service/BoardService"))
    public static let deliveryService = TargetDependency.project(target: "DeliveryService", path: .relativeToRoot("Mukgen/Service/DeliveryService"))
    public static let mealSaggestionService = TargetDependency.project(target: "MealSaggestionService", path: .relativeToRoot("Mukgen/Service/MealSaggestionService"))
    public static let mealService = TargetDependency.project(target: "MealService", path: .relativeToRoot("Mukgen/Service/MealService"))
    public static let reViewService = TargetDependency.project(target: "ReViewService", path: .relativeToRoot("Mukgen/Service/ReViewService"))
    public static let userService = TargetDependency.project(target: "UserService", path: .relativeToRoot("Mukgen/Service/UserService"))
}
