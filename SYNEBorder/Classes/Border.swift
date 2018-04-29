//
//  Border.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class Border {
    
    // MARK: ************************************  ******************************************

    private weak var borderView: BorderView!
    
    // MARK: ************************************  ******************************************

    internal init(_ borderView: BorderView) {
        self.borderView = borderView
    }
    
    // MARK: ************************************  ******************************************

    public private(set) lazy var edges: BorderEdges = {
        
        let edges = BorderEdges(border: self)
        
        self.borderView.layer.addSublayer(edges.top.layer)
        self.borderView.layer.addSublayer(edges.right.layer)
        self.borderView.layer.addSublayer(edges.bottom.layer)
        self.borderView.layer.addSublayer(edges.left.layer)
        
        return edges
    }()
    
    public private(set) lazy var corners: BorderCorners = {
        
        let corners = BorderCorners(border: self)
        
        self.borderView.layer.addSublayer(corners.topLeft.layer)
        self.borderView.layer.addSublayer(corners.topRight.layer)
        self.borderView.layer.addSublayer(corners.bottomRight.layer)
        self.borderView.layer.addSublayer(corners.bottomLeft.layer)
        
        return corners
    }()
    
    // MARK: ************************************  ******************************************

    /// Changing this property updates the color for all borders in the view
    public var color: UIColor = .clear {
        didSet {
            edges.update(.all, color: color)
            corners.update(.allCorners, color: color)
            updateBorderLayer()
        }
    }
    
    /// Changing this property updates the width for all borders in the view
    public var width: CGFloat = 0 {
        didSet {
            edges.update(.all, width: width)
            corners.update(.allCorners, width: width)
            updateBorderLayer()
        }
    }
    
    /// Changing this property updates the radius for all corner borders in the view
    public var radius: CGFloat = 0 {
        didSet {
            corners.update(.allCorners, radius: radius)
            updateBorderLayer()
        }
    }
    
    /// Changing this property updates the dotted setting for all borders in the view
    public var dotted: Bool = false {
        didSet {
            edges.update(.all, dotted: dotted)
            corners.update(.allCorners, dotted: dotted)
            updateBorderLayer()
        }
    }
    
    // MARK: ************************************  ******************************************
    
    private func updateBorderLayer() {
        borderView.updateBorderLayer()
    }
    
    // MARK: ************************************  ******************************************

    public func remove() {
        borderView.removeFromSuperview()
    }
    
    // MARK: ************************************  ******************************************

    /// Updates properties for the specified edges
    public func update(edges: UIRectEdge, width: CGFloat, color: UIColor, dotted: Bool = false) {
        
        // Update edges values
        
        self.edges.update(edges, width: width, color: color, dotted: dotted)
        
        // Update border appearance using new values
        
        updateBorderLayer()
    }
    
    /// Updates properties for the specified corners
    public func update(corners: UIRectCorner = .allCorners, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        
        // Update corners values
        
        self.corners.update(corners, width: width, color: color, radius: radius, dotted: dotted)
        
        // Update border appearance using new values
        
        updateBorderLayer()
    }
    
    /// Updates properties for the specified edges and/or corners
    public func update(edges: UIRectEdge, corners: UIRectCorner, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        
        // Update edges values
        
        self.edges.update(edges, width: width, color: color, dotted: dotted)
        
        // Update corners values
        
        self.corners.update(corners, width: width, color: color, radius: radius, dotted: dotted)
        
        // Update border appearance using new values
        
        updateBorderLayer()
    }
    
    // MARK: ************************************  ******************************************
}


