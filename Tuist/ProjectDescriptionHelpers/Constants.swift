import ProjectDescription
import Foundation

public enum Constants {
    public static let BUNDLE_ID = "com.martynenko.vadim"
    public static let ORGANIZATION_NAME = "Vadim Martynenko"
    public static let MIN_TARGET_IOS = "15.0"
    public static let DEFAULT_LOCATE_RESOURCES: ResourceFileElements = ["Sources/Resources/**"]
    public static let DEFAULT_INFO_PLIST: InfoPlist = .extendingDefault(
        with: [
            "UILaunchStoryboardName": "LaunchScreen.storyboard",
            "CFBundleDisplayName": "ModularFeedApp"
        ]
    )
}
