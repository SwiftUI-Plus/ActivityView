import UIKit

/// Represents an activity for presenting an ActivityView (Share sheet) via the `activitySheet` modifier
public struct ActivityItem {

    internal var items: [Any]
    internal var activities: [UIActivity]

    /// The
    /// - Parameters:
    ///   - items: The items to share via a `UIActivityViewController`
    ///   - activities: Custom activities you want to include in the sheet
    public init(items: Any..., activities: [UIActivity] = []) {
        self.items = items
        self.activities = activities
    }
    
}
