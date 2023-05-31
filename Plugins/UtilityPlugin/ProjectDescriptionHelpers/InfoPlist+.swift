import Foundation
import ProjectDescription

public extension ProjectDescription.InfoPlist {

    static let `defaultFile`: ProjectDescription.InfoPlist = .file(path: .relativeToRoot("Support/Info.plist"))
}
