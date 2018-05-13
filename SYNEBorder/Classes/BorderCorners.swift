//
//  BorderCorners.swift
//  Border
//
//  Created by DeShawn Jackson on 4/29/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

public class BorderCorners {
    
    public private(set) var topLeft = BorderCorner(.topLeft)
    public private(set) var bottomLeft = BorderCorner(.bottomLeft)
    public private(set) var topRight = BorderCorner(.topRight)
    public private(set) var bottomRight = BorderCorner(.bottomRight)
    
    public init() { }
    
    internal init(border: Border) {
        setBorder(border)
    }
    
    internal weak var border: Border!
    
    internal func setBorder(_ border: Border) {
        self.border = border
        topLeft.border = border
        bottomLeft.border = border
        topRight.border = border
        bottomRight.border = border
    }
    
    public func copy() -> BorderCorners {
        
        let newCorners = BorderCorners()
        
        newCorners.topLeft = self.topLeft.copy()
        newCorners.bottomLeft = self.bottomLeft.copy()
        newCorners.topRight = self.topRight.copy()
        newCorners.bottomRight = self.bottomRight.copy()
        
        return newCorners
    }
    
    internal func _update() {
        self.border?.update()
    }
    
    /// Updates only the width for the specified corners
    public func update(_ corners: UIRectCorner, width: CGFloat) {
        _update(corners, width: width)
        _update()
    }
    
    /// Updates only the width for the specified corners
    internal func _update(_ corners: UIRectCorner, width: CGFloat) {
        
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
    public func update(_ corners: UIRectCorner, color: UIColor) {
        _update(corners, color: color)
        _update()
    }
    
    /// Updates only the color for the specified corners
    internal func _update(_ corners: UIRectCorner, color: UIColor) {
        
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
    public func update(_ corners: UIRectCorner, radius: CGFloat) {
        _update(corners, radius: radius)
        _update()
    }
    
    /// Updates only the radius for the specified corners
    internal func _update(_ corners: UIRectCorner, radius: CGFloat) {
        
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
    public func update(_ corners: UIRectCorner, dotted: Bool) {
        _update(corners, dotted: dotted)
        _update()
    }
    
    /// Updates only the dotted property for the specified corners
    internal func _update(_ corners: UIRectCorner, dotted: Bool) {
        
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
    public func update(_ corners: UIRectCorner, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        _update(corners, width: width, color: color, radius: radius, dotted: dotted)
        _update()
    }
    
    /// Updates the width, color, radius, and dotted property for the specified corners
    internal func _update(_ corners: UIRectCorner, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool) {
        
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
