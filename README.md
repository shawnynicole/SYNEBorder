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

Swift 4

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

// Remove all borders
view.border.remove()
```

See example project for more samples.

## Author

shawnynicole

## License

SYNEBorder is available under the MIT license. See the LICENSE file for more info.
