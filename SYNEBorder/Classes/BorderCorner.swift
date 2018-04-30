//
//  BorderCorner.swift
//  Border
//
//  Created by DeShawn Jackson on 4/28/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

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
