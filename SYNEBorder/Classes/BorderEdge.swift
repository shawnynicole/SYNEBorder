//
//  BorderEdge.swift
//  Border
//
//  Created by DeShawn Jackson on 4/28/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class BorderEdges {
    
    public private(set) var top = BorderEdge(.top)
    public private(set) var bottom = BorderEdge(.bottom)
    public private(set) var left = BorderEdge(.left)
    public private(set) var right = BorderEdge(.right)
    
    internal init(border: Border) {
        
        top.border = border
        bottom.border = border
        left.border = border
        right.border = border
    }
    
    /// Updates only the width for the specified edges
    internal func update(_ edges: UIRectEdge, width: CGFloat) {
        
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
    internal func update(_ edges: UIRectEdge, color: UIColor) {
        
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
    internal func update(_ edges: UIRectEdge, dotted: Bool) {
        
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
    internal func update(_ edges: UIRectEdge, width: CGFloat, color: UIColor, dotted: Bool) {
        
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

public class BorderEdge {
    
    public enum Edge {
        case top, bottom, left, right
        
        var edge: UIRectEdge {
            switch self {
            case .top: return .top
            case .bottom: return .bottom
            case .left: return .left
            case .right: return .right
            }
        }
    }
    
    private let edge: Edge
    private var _width: CGFloat = 0
    private var _color: UIColor = .clear
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
    
    public var dotted: Bool {
        get { return _dotted }
        set {
            _dotted = newValue
            update()
        }
    }
    
    internal weak var border: Border!
    
    internal let layer: CAShapeLayer = {
       
        let layer = CAShapeLayer()
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        return layer
        
    }()
    
    internal init(_ edge: Edge) {
        self.edge = edge
    }
    
    /// Updates the properties, but does not update the layer appearance. Used to update properties, then update the layer appearance after all desired properties are updated.
    internal func _update(width: CGFloat, color: UIColor, dotted: Bool) {
        self._width = width
        self._color = color
        self._dotted = dotted
    }
    
    /// Updates the property values, then updates the layer appearance.
    public func update(width: CGFloat, color: UIColor, dotted: Bool = false) {
        
        self._width = width
        self._color = color
        self._dotted = dotted
        
        update()
    }
    
    private func update() {
        border?.update(edges: edge.edge, width: width, color: color, dotted: dotted)
    }
}
