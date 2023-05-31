//import ProjectDescription
//import ProjectDescriptionHelpers
//import MyPlugin
//
///*
//                +-------------+
//                |             |
//                |     App     | Contains TuistSample App target and TuistSample unit-test target
//                |             |
//         +------+-------------+-------+
//         |         depends on         |
//         |                            |
// +----v-----+                   +-----v-----+
// |          |                   |           |
// |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
// |          |                   |           |
// +----------+                   +-----------+
//
// */
//
//// MARK: - Project
//
//// Local plugin loaded
//let localHelper = LocalHelper(name: "MyPlugin")
//
//// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "TuistSample",
//                          platform: .iOS,
//                          additionalTargets: ["TuistSampleKit", "TuistSampleUI"])
