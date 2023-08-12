import ProjectDescription

let dependencies = Dependencies(
     swiftPackageManager: .init(
         [
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.0.1")),
            .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "3.0.0")),
            .remote(url: "https://github.com/Moya/Moya", requirement: .upToNextMajor(from: "15.0.0")),
            .remote(url: "https://github.com/jrendel/SwiftKeychainWrapper", requirement: .upToNextMajor(from: "4.0.1")),
         ],
         productTypes: [
            "SnapKit": .framework,
            "Then": .framework,
            "Moya": .framework,
            "SwiftKeychainWrapper": .framework,
         ]
     ),
     platforms: [.iOS]
 )
