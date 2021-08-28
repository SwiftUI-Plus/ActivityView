import SwiftUI
import LinkPresentation
import CoreServices

public extension View {

    /// Presents an activity sheet when the associated `ActivityItem` is present
    ///
    /// The system provides several standard services, such as copying items to the pasteboard, posting content to social media sites, sending items via email or SMS, and more. Apps can also define custom services.
    /// 
    /// - Parameters:
    ///   - item: The item to use for this activity
    ///   - onComplete: When the sheet is dismissed, the this will be called with the result
    func activitySheet(_ item: Binding<ActivityItem?>, permittedArrowDirections: UIPopoverArrowDirection = .any, onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) -> some View {
        background(ActivityView(item: item, permittedArrowDirections: permittedArrowDirections, onComplete: onComplete))
    }

}

private struct ActivityView: UIViewControllerRepresentable {

    @Binding var item: ActivityItem?
    private var permittedArrowDirections: UIPopoverArrowDirection
    private var completion: UIActivityViewController.CompletionWithItemsHandler?

    public init(item: Binding<ActivityItem?>, permittedArrowDirections: UIPopoverArrowDirection, onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) {
        _item = item
        self.permittedArrowDirections = permittedArrowDirections
        self.completion = onComplete
    }

    func makeUIViewController(context: Context) -> ActivityViewControllerWrapper {
        ActivityViewControllerWrapper(item: $item, permittedArrowDirections: permittedArrowDirections, completion: completion)
    }

    func updateUIViewController(_ controller: ActivityViewControllerWrapper, context: Context) {
        controller.item = $item
        controller.completion = completion
        controller.updateState()
    }

}

private final class ActivityViewControllerWrapper: UIViewController {

    var item: Binding<ActivityItem?>
    var permittedArrowDirections: UIPopoverArrowDirection
    var completion: UIActivityViewController.CompletionWithItemsHandler?

    init(item: Binding<ActivityItem?>, permittedArrowDirections: UIPopoverArrowDirection, completion: UIActivityViewController.CompletionWithItemsHandler?) {
        self.item = item
        self.permittedArrowDirections = permittedArrowDirections
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        updateState()
    }

    fileprivate func updateState() {
        let isActivityPresented = presentedViewController != nil

        if item.wrappedValue != nil {
            if !isActivityPresented {
                let controller = UIActivityViewController(activityItems: item.wrappedValue?.items ?? [], applicationActivities: item.wrappedValue?.activities)
                controller.popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
                controller.popoverPresentationController?.sourceView = view
                controller.completionWithItemsHandler = { [weak self] (activityType, success, items, error) in
                    self?.item.wrappedValue = nil
                    self?.completion?(activityType, success, items, error)
                }
                present(controller, animated: true, completion: nil)
            }
        }
    }

}
