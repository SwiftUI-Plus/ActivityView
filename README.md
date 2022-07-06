![ios](https://img.shields.io/badge/iOS-13-green)

----

> This backport is now available as `Backport.ShareLink`, in a single Backports library, with a LOT more additions. This should simply my efforts and allow me and others to contribute more backports in the near future.
> [SwiftUI Backports](https://github.com/shaps80/SwiftUIBackports)

----

# ActivityView

> Also available as a part of my [SwiftUI+ Collection](https://benkau.com/packages.json) – just add it to Xcode 13+

A SwiftUI view that enables you to properly present a `UIActivityViewController`.

## Features

-   Convenient modifier API
-   Correctly lays out full screen
-   Full support for `UIActivityViewController`

## Example

```swift
@State private var item: ActivityItem?

var body: some View {
    Button {
        item = ActivityItem(
            items: "This will be shared"
        )
    } label: {
        Text("Share")
    }
    .activitySheet($item)
}
```

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (**preferred**)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/SwiftUI-Plus/ActivityView.git", .upToNextMinor(from: "1.0.0"))`

> Note: The package requires iOS v13+

## Other Packages

If you want easy access to this and more packages, add the following collection to your Xcode 13+ configuration:

`https://benkau.com/packages.json`
