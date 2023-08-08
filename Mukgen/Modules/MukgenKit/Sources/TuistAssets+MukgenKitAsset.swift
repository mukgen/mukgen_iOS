// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

public enum MukgenKitAsset {
    
    public enum Colors {
        public static let accentColor = MukgenKitColors(name: "AccentColor")
        public static let pointBase = MukgenKitColors(name: "PointBase")
        public static let pointLight1 = MukgenKitColors(name: "PointLight1")
        public static let pointLight2 = MukgenKitColors(name: "PointLight2")
        public static let pointLight3 = MukgenKitColors(name: "PointLight3")
        public static let pointLight4 = MukgenKitColors(name: "PointLight4")
        public static let primaryBase = MukgenKitColors(name: "PrimaryBase")
        public static let primaryDark1 = MukgenKitColors(name: "PrimaryDark1")
        public static let primaryDark2 = MukgenKitColors(name: "PrimaryDark2")
        public static let primaryLight1 = MukgenKitColors(name: "PrimaryLight1")
        public static let primaryLight2 = MukgenKitColors(name: "PrimaryLight2")
        public static let primaryLight3 = MukgenKitColors(name: "PrimaryLight3")
    }
    
    public enum Images {
        public static let lunch = MukgenKitImages(name: "Lunch")
        public static let mukgen = MukgenKitImages(name: "MUKGEN")
        public static let mukgenIcon = MukgenKitImages(name: "MukgenIcon")
        public static let night = MukgenKitImages(name: "Night")
        public static let breakfastImage = MukgenKitImages(name: "breakfastImage")
        public static let board = MukgenKitImages(name: "Board")
        public static let delivery = MukgenKitImages(name: "Delivery")
        public static let home = MukgenKitImages(name: "Home")
        public static let review = MukgenKitImages(name: "Review")
        public static let suggestion = MukgenKitImages(name: "Suggestion")
        public static let chat = MukgenKitImages(name: "Chat")
        public static let eye = MukgenKitImages(name: "Eye")
        public static let hot = MukgenKitImages(name: "HOT")
        public static let heart = MukgenKitImages(name: "Heart")
        public static let tendinousHeart = MukgenKitImages(name: "TendinousHeart")
        public static let noHeart = MukgenKitImages(name: "NoHeart")
        public static let check = MukgenKitImages(name: "Check")
        public static let checked = MukgenKitImages(name: "Checked")
        public static let testProfile = MukgenKitImages(name: "TestProfileImage")
        public static let testProfile1 = MukgenKitImages(name: "TestProfile1")
        public static let testProfile2 = MukgenKitImages(name: "TestProfile2")
        public static let testProfile3 = MukgenKitImages(name: "TestProflie3")
        public static let signUpMukgenIcon = MukgenKitImages(name: "SignUpMukgenIcon")
    }
    
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details
public final class MukgenKitColors {
    
    public fileprivate(set) var name: String
    
    #if os(macOS)
    public typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    public typealias Color = UIColor
    #endif
    
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    public private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()
    
    public var cgColor: CGColor {
        #if os(macOS)
        return color.cgColor
        #elseif os(iOS) || os(tvOS) || os(watchOS)
        return color.cgColor
        #endif
    }
    
    fileprivate init(name: String) {
        self.name = name
    }
}

public extension MukgenKitColors.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: MukgenKitColors) {
        let bundle = MukgenKitResources.bundle
#if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}

public struct MukgenKitImages {
    public fileprivate(set) var name: String
    
#if os(macOS)
    public typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
    public typealias Image = UIImage
#endif
    
    public var image: Image {
        let bundle = MukgenKitResources.bundle
#if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        let image = bundle.image(forResource: NSImage.Name(name))
#elseif os(watchOS)
        let image = Image(named: name)
#endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
}

public extension MukgenKitImages.Image {
    @available(macOS, deprecated,
               message: "This initializer is unsafe on macOS, please use the INFOKitImages.image property")
    convenience init?(asset: MukgenKitImages) {
#if os(iOS) || os(tvOS)
        let bundle = MukgenKitResources.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}

// swiftlint:enable all
// swiftformat:enable all
