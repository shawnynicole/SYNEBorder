//
//  BorderEdges.swift
//  Border
//
//  Created by DeShawn Jackson on 4/29/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class BorderEdges {
    
    public private(set) var top = BorderEdge(.top)
    public private(set) var bottom = BorderEdge(.bottom)
    public private(set) var left = BorderEdge(.left)
    public private(set) var right = BorderEdge(.right)
    
    public init() { }
    
    internal init(border: Border) {
        setBorder(border)
    }
    
    internal weak var border: Border!
    
    internal func setBorder(_ border: Border) {
        self.border = border
        top.border = border
        bottom.border = border
        left.border = border
        right.border = border
    }
    
    internal func _update() {
        self.border?.update()
    }
    
    /// Updates only the width for the specified edges
    public func update(_ edges: UIRectEdge, width: CGFloat) {
        _update(edges, width: width)
        _update()
    }
        
    /// Updates only the width for the specified edges
    internal func _update(_ edges: UIRectEdge, width: CGFloat) {
        
        if edges.contains(.top) {
            self.top._update(width: width, color: top.color, dotted: top.dotted)
        }
        
        if edges.contains(.bottom) {
            self.bottom._update(width: width, color: bottom.color, dotted: bottom.dotted)
        }
        
        if edges.contains(.left) {
            self.left._update(width: width, color: left.color, dotted: left.dotted)
        }
        
        if edges.contains(.right) {
            self.right._update(width: width, color: right.color, dotted: right.dotted)
        }
    }
    
    /// Updates only the color for the specified edges
    public func update(_ edges: UIRectEdge, color: UIColor) {
        _update(edges, color: color)
        _update()
    }
    
    /// Updates only the color for the specified edges
    internal func _update(_ edges: UIRectEdge, color: UIColor) {
        
        if edges.contains(.top) {
            self.top._update(width: top.width, color: color, dotted: top.dotted)
        }
        
        if edges.contains(.bottom) {
            self.bottom._update(width: bottom.width, color: color, dotted: bottom.dotted)
        }
        
        if edges.contains(.left) {
            self.left._update(width: left.width, color: color, dotted: left.dotted)
        }
        
        if edges.contains(.right) {
            self.right._update(width: right.width, color: color, dotted: right.dotted)
        }
    }
    
    /// Updates only the dotted property for the specified edges
    public func update(_ edges: UIRectEdge, dotted: Bool) {
        _update(edges, dotted: dotted)
        _update()
    }
    
    /// Updates only the dotted property for the specified edges
    internal func _update(_ edges: UIRectEdge, dotted: Bool) {
        
        if edges.contains(.top) {
            self.top._update(width: top.width, color: top.color, dotted: dotted)
        }
        
        if edges.contains(.bottom) {
            self.bottom._update(width: bottom.width, color: bottom.color, dotted: dotted)
        }
        
        if edges.contains(.left) {
            self.left._update(width: left.width, color: left.color, dotted: dotted)
        }
        
        if edges.contains(.right) {
            self.right._update(width: right.width, color: right.color, dotted: dotted)
        }
    }
    
    /// Updates the width, color, and dotted properties for the specified edges
    public func update(_ edges: UIRectEdge, width: CGFloat, color: UIColor, dotted: Bool = false) {
        _update(edges, width: width, color: color, dotted: dotted)
        _update()
    }
    
    /// Updates the width, color, and dotted properties for the specified edges
    internal func _update(_ edges: UIRectEdge, width: CGFloat, color: UIColor, dotted: Bool) {
        
        if edges.contains(.top) {
            self.top._update(width: width, color: color, dotted: dotted)
        }
        
        if edges.contains(.bottom) {
            self.bottom._update(width: width, color: color, dotted: dotted)
        }
        
        if edges.contains(.left) {
            self.left._update(width: width, color: color, dotted: dotted)
        }
        
        if edges.contains(.right) {
            self.right._update(width: width, color: color, dotted: dotted)
        }
    }
}
