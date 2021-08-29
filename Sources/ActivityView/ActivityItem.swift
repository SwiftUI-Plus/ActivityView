import UIKit

/// Represents an activity for presenting an ActivityView (Share sheet) via the `activitySheet` modifier
public struct ActivityItem {

    internal var items: [Any]
    internal var activities: [UIActivity]
    internal var excludedTypes: [UIActivity.ActivityType]

    /// The
    /// - Parameters:
    ///   - items: The items to share via a `UIActivityViewController`
    ///   - activities: Custom activities you want to include in the sheet
    public init(items: Any..., activities: [UIActivity] = [], excludedTypes: [UIActivity.ActivityType] = []) {
        self.items = items
        self.activities = activities
        self.excludedTypes = excludedTypes
    }
    
}
