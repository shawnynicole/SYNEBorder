//
//  BorderCorner.swift
//  Border
//
//  Created by DeShawn Jackson on 4/28/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class BorderCorners {
    
    public private(set) var topLeft = BorderCorner(.topLeft)
    public private(set) var bottomLeft = BorderCorner(.bottomLeft)
    public private(set) var topRight = BorderCorner(.topRight)
    public private(set) var bottomRight = BorderCorner(.bottomRight)
    
    internal init(border: Border) {
        
        topLeft.border = border
        bottomLeft.border = border
        topRight.border = border
        bottomRight.border = border
    }
    
    /// Updates only the width for the specified corners
    internal func update(_ corners: UIRectCorner, width: CGFloat) {
        
        if corners.contains(.topLeft) {
            self.topLeft._update(width: width, color: topLeft.color, radius: topLeft.radius, dotted: topLeft.dotted)
        }
        
        if corners.contains(.bottomLeft) {
            self.bottomLeft._update(width: width, color: bottomLeft.color, radius:
                bottomLeft.radius, dotted: bottomLeft.dotted)
        }
        
        if corners.contains(.topRight) {
            self.topRight._update(width: width, color: topRight.color, radius: topRight.radius, dotted: topRight.dotted)
        }
        
        if corners.contains(.bottomRight) {
            self.bottomRight._update(width: width, color: bottomRight.color, radius: bottomRight.radius, dotted: bottomRight.dotted)
        }
    }
    
    /// Updates only the color for the specified corners
    internal func update(_ corners: UIRectCorner, color: UIColor) {
        
        if corners.contains(.topLeft) {
            self.topLeft._update(width: topLeft.width, color: color, radius: topLeft.radius, dotted: topLeft.dotted)
        }
        
        if corners.contains(.bottomLeft) {
            self.bottomLeft._update(width: bottomLeft.width, color: color, radius: bottomLeft.radius, dotted: bottomLeft.dotted)
        }
        
        if corners.contains(.topRight) {
            self.topRight._update(width: topRight.width, color: color, radius: topRight.radius, dotted: topRight.dotted)
        }
        
        if corners.contains(.bottomRight) {
            self.bottomRight._update(width: bottomRight.width, color: color, radius: bottomRight.radius, dotted: bottomRight.dotted)
        }
    }
    
    /// Updates only the radius for the specified corners
    internal func update(_ corners: UIRectCorner, radius: CGFloat) {
        
        if corners.contains(.topLeft) {
            self.topLeft._update(width: topLeft.width, color: topLeft.color, radius: radius, dotted: topLeft.dotted)
        }
        
        if corners.contains(.bottomLeft) {
            self.bottomLeft._update(width: bottomLeft.width, color: bottomLeft.color, radius: radius, dotted: bottomLeft.dotted)
        }
        
        if corners.contains(.topRight) {
            self.topRight._update(width: topRight.width, color: topRight.color, radius: radius, dotted: topRight.dotted)
        }
        
        if corners.contains(.bottomRight) {
            self.bottomRight._update(width: bottomRight.width, color: bottomRight.color, radius: radius, dotted: bottomRight.dotted)
        }
    }
    
    /// Updates only the dotted property for the specified corners
    internal func update(_ corners: UIRectCorner, dotted: Bool) {
        
        if corners.contains(.topLeft) {
            self.topLeft._update(width: topLeft.width, color: topLeft.color, radius: topLeft.radius, dotted: dotted)
        }
        
        if corners.contains(.bottomLeft) {
            self.bottomLeft._update(width: bottomLeft.width, color: bottomLeft.color, radius: bottomLeft.radius, dotted: dotted)
        }
        
        if corners.contains(.topRight) {
            self.topRight._update(width: topRight.width, color: topRight.color, radius: topRight.radius, dotted: dotted)
        }
        
        if corners.contains(.bottomRight) {
            self.bottomRight._update(width: bottomRight.width, color: bottomRight.color, radius: bottomRight.radius, dotted: dotted)
        }
    }
    
    /// Updates the width, color, radius, and dotted property for the specified corners
    internal func update(_ corners: UIRectCorner, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool) {
        
        if corners.contains(.topLeft) {
            self.topLeft._update(width: width, color: color, radius: radius, dotted: dotted)
        }
        
        if corners.contains(.topRight) {
            self.topRight._update(width: width, color: color, radius: radius, dotted: dotted)
        }
        
        if corners.contains(.bottomLeft) {
            self.bottomLeft._update(width: width, color: color, radius: radius, dotted: dotted)
        }
        
        if corners.contains(.bottomRight) {
            self.bottomRight._update(width: width, color: color, radius: radius, dotted: dotted)
        }
    }
}

public class BorderCorner {
    
    public enum Corner {
        case topLeft, bottomLeft, topRight, bottomRight
        
        var corner: UIRectCorner {
            switch self {
            case .topLeft: return .topLeft
            case .bottomLeft: return .bottomLeft
            case .topRight: return .topRight
            case .bottomRight: return .bottomRight
            }
        }
    }
    
    private let corner: Corner
    private var _width: CGFloat = 0
    private var _color: UIColor = .clear
    private var _radius: CGFloat = 0
    private var _dotted: Bool = false
    
    public var width: CGFloat {
        get { return _width }
        set {
            _width = newValue
            update()
        }
    }
    
    public var color: UIColor {
        get { return _color }
        set {
            _color = newValue
            update()
        }
    }
    
    public var radius: CGFloat {
        get { return _radius }
        set {
            _radius = newValue
            update()
        }
    }
    
    public var dotted: Bool {
        get { return _dotted }
        set {
            _dotted = newValue
            update()
        }
    }
    
    internal weak var border: Border!
    
    internal let layer = CAShapeLayer()
    
    internal init(_ corner: Corner) {
        self.corner = corner
    }
    
    /// Updates the properties, but does not update the layer appearance. Used to update properties, then update the layer appearance after all desired properties are updated.
    internal func _update(width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool) {
        self._width = width
        self._color = color
        self._radius = radius
        self._dotted = dotted
    }
    
    /// Updates the property values, then updates the layer appearance.
    public func update(width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        self._width = width
        self._color = color
        self._radius = radius
        self._dotted = dotted
        
        update()
    }
    
    private func update() {
        border?.update(corners: corner.corner, width: width, color: color, radius: radius, dotted: dotted)
    }
}
