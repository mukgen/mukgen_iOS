import ProjectDescription

let dependencies = Dependencies(
     swiftPackageManager: .init(
         [
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.0.1")),
            .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "3.0.0"))
         ],
         productTypes: [
            "SnapKit": .framework,
            "Then": .framework,
         ]
     ),
     platforms: [.iOS]
 )
