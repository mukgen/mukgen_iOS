import Foundation
import ProjectDescription

public extension ProjectDescription.DeploymentTarget {

    static let `defaultTarget`: ProjectDescription.DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .ipad])
}
