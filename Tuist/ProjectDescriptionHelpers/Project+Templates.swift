import ProjectDescription
import UtilityPlugin

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/
///
public extension Project {

    static let bundleId = "com.info.mukgen"

    // MARK: make App

    static func app(
        name: String,
        product: Product = .app,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return project(
            name: name,
            product: product,
            dependencies: dependencies,
            resources: resources
        )
    }

    // MARK: make Framework(from a Project)

    static func framework(
        name: String,
        product: Product = .framework,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return project(
            name: name,
            product: product,
            dependencies: dependencies,
            resources: resources
        )
    }

    // MARK: make Project

    static func project(
        name: String,
        product: Product,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project{
        return Project(
            name: name,
            settings: .makeSetting(),
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: product,
                    bundleId: "\(bundleId).\(name)",
                    deploymentTarget: .defaultTarget,
                    infoPlist: .defaultFile,
                    sources: ["Sources/**"],
                    resources: resources,
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "\(bundleId).\(name)Tests",
                    deploymentTarget: .defaultTarget,
                    infoPlist: .defaultFile,
                    sources: ["Tests/**"],
                    dependencies: [.target(name: name)]
                )
            ],
            schemes: [.makeScheme(target: .debug, name: name)]
        )
    }
}

// MARK: make Settings

public extension Settings{
    static func makeSetting() -> Settings {
        return settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ],
            defaultSettings: .recommended
        )
    }
}

// MARK: make Scheme

public extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
