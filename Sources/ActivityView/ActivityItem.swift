import UIKit

/// Represents an activity for presenting an ActivityView (Share sheet) via the `activitySheet` modifier
public struct ActivityItem {

    internal var items: [Any]
    internal var activities: [UIActivity]
    internal var excludedTypes: [UIActivity.ActivityType]

    /// Represents an activity for presenting an ActivityView (Share sheet) via the `activitySheet` modifier
    /// - Parameters:
    ///   - items: The items to share via a `UIActivityViewController`
    ///   - activities: Custom activities you want to include in the sheet
    ///   - excludedTypes: Activity types to exclude from the sheet
    public init(items: Any..., activities: [UIActivity] = [], excludedTypes: [UIActivity.ActivityType] = []) {
        self.init(itemsArray: items, activities: activities, excludedTypes: excludedTypes)
    }

    /// Represents an activity for presenting an ActivityView (Share sheet) via the `activitySheet` modifier.
    /// - Parameters:
    ///   - itemsArray: The items to share via a `UIActivityViewController`
    ///   - activities: Custom activities you want to include in the sheet
    ///   - excludedTypes: Activity types to exclude from the sheet
    public init(itemsArray items: [Any], activities: [UIActivity] = [], excludedTypes: [UIActivity.ActivityType] = []) {
        self.items = items
        self.activities = activities
        self.excludedTypes = excludedTypes
    }
    
}
