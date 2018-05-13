//
//  BorderEdge.swift
//  Border
//
//  Created by DeShawn Jackson on 4/28/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

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
    
    public func copy() -> BorderEdge {
        
        let newEdge = BorderEdge(edge)
        newEdge._update(width: width, color: color, dotted: dotted)
        
        return newEdge
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
