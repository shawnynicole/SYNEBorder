# SYNEBorder

[![CI Status](https://img.shields.io/travis/shawnynicole/SYNEBorder.svg?style=flat)](https://travis-ci.org/shawnynicole/SYNEBorder)
[![Version](https://img.shields.io/cocoapods/v/SYNEBorder.svg?style=flat)](https://cocoapods.org/pods/SYNEBorder)
[![License](https://img.shields.io/cocoapods/l/SYNEBorder.svg?style=flat)](https://cocoapods.org/pods/SYNEBorder)
[![Platform](https://img.shields.io/cocoapods/p/SYNEBorder.svg?style=flat)](https://cocoapods.org/pods/SYNEBorder)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first or use:

```ruby
try pod 'SYNEBorder'
```

## Requirements

Swift 5

## Installation

SYNEBorder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SYNEBorder'
```

## Usage

```ruby

let rect = CGRect(x: 0, y: 0, width: 200, height: 300)
let view = UIView(frame: rect)

// Note: Using view.border creates a new border reference if one does not exist.
// To check if a border exists without creating a border reference, use:
if view.hasBorder {
    // view does have a border
} else {
    // view does not have a border
}

// Add a dotted, black border with all corners rounded
view.border.update(edges: .all, corners: .allCorners, width: 1, color: .black, radius: 20, dotted: true)

// Update the topLeft corner to be solid instead of dotted
view.border.corners.topLeft.dotted = false

// Update the bottom edge to be green
view.border.edges.bottom.color = .green

// Update the width of all borders to 2
view.border.width = 2

// Update left corners to a radius of 10, keeping all previous settings
view.border.update(corners: .left, width: 1, color: .black, radius: 10, dotted: true)

// Create and configure a new border
let border = Border(width: 1, color: .black)

// Setting the border removes the old border and applies the new border's settings
view.border = border

// Remove all borders and corner rounding, returning the view to its original state
view.border.remove()

// To hide the border without removing it, use:
view.border.isHidden = true

// To change the border's alpha value, use:
view.border.alpha = 0.5

// To create a copy of the border, use:
let newBorder = view.border.copy()
// This will change the width of newBorder but will not change the width of view.border.
newBorder.width = 5 
```

See example project for more samples.

## Author

shawnynicole

## License

SYNEBorder is available under the MIT license. See the LICENSE file for more info.
