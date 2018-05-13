//
//  Border.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

public class Border {
    
    // MARK: ************************************  ******************************************
    
    /// Hides the border without removing it.
    public var isHidden: Bool = false {
        didSet {
            borderView?.isHidden = isHidden
        }
    }
    
    /// The border's alpha value.
    public var alpha: CGFloat = 1 {
        didSet {
            borderView?.alpha = alpha
        }
    }
    
    // MARK: ************************************  ******************************************
    
    internal weak var borderView: BorderView! {
        didSet {
            borderView?.isHidden = isHidden
            borderView?.alpha = alpha
            addBorderSublayers()
        }
    }
    
    // MARK: ************************************  ******************************************
    
    internal init(_ borderView: BorderView) {
        self.borderView = borderView
        self.addBorderSublayers() // NOTE: didSet is not called for borderView during init
    }
    
    // MARK: ************************************  ******************************************
    
    public init(edges: BorderEdges? = nil, corners: BorderCorners? = nil) {
        
        if let edges = edges {
            self.edges = edges
        }
        
        if let corners = corners {
            self.corners = corners
        }
    }
    
    public init(edges: UIRectEdge = .all, corners: UIRectCorner = .allCorners, width: CGFloat, color: UIColor, radius: CGFloat = 0, dotted: Bool = false) {
        self.update(edges: edges, corners: corners, width: width, color: color, radius: radius, dotted: dotted)
    }
    
    // MARK: ************************************  ******************************************
    
    /// Returns a new instance of `Border` with the same settings.
    public func copy() -> Border {
        
        let edges = self.edges.copy()
        let corners = self.corners.copy()
        
        let newBorder = Border(edges: edges, corners: corners)
        
        return newBorder
    }
    
    // MARK: ************************************  ******************************************

    public private(set) lazy var edges: BorderEdges = BorderEdges(border: self)
    
    public private(set) lazy var corners: BorderCorners = BorderCorners(border: self)
    
    // MARK: ************************************  ******************************************
    
    private func addBorderSublayers() {
        
        // Remove any existing sublayers, if applicable
        
        borderView.layer.sublayers?.removeAll()
        
        // Add edge layers
        
        borderView.layer.addSublayer(edges.top.layer)
        borderView.layer.addSublayer(edges.right.layer)
        borderView.layer.addSublayer(edges.bottom.layer)
        borderView.layer.addSublayer(edges.left.layer)
        
        // Add corner layers
        
        borderView.layer.addSublayer(corners.topLeft.layer)
        borderView.layer.addSublayer(corners.topRight.layer)
        borderView.layer.addSublayer(corners.bottomRight.layer)
        borderView.layer.addSublayer(corners.bottomLeft.layer)
    }
    
    // MARK: ************************************  ******************************************

    /// Changing this property updates the color for all borders in the view
    public var color: UIColor = .clear {
        didSet {
            edges._update(.all, color: color)
            corners._update(.allCorners, color: color)
            update()
        }
    }
    
    /// Changing this property updates the width for all borders in the view
    public var width: CGFloat = 0 {
        didSet {
            edges._update(.all, width: width)
            corners._update(.allCorners, width: width)
            update()
        }
    }
    
    /// Changing this property updates the radius for all corner borders in the view
    public var radius: CGFloat = 0 {
        didSet {
            corners._update(.allCorners, radius: radius)
            update()
        }
    }
    
    /// Changing this property updates the dotted setting for all borders in the view
    public var dotted: Bool = false {
        didSet {
            edges._update(.all, dotted: dotted)
            corners._update(.allCorners, dotted: dotted)
            update()
        }
    }
    
    // MARK: ************************************  ******************************************
    
    internal func update() {
        borderView?.update()
    }
    
    // MARK: ************************************  ******************************************

    /// Removes border and rounded corners
    public func remove() {
        borderView?.remove()
    }
    
    // MARK: ************************************  ******************************************

    /// Updates properties for the specified edges
    public func update(edges: UIRectEdge, width: CGFloat, color: UIColor, dotted: Bool = false) {
        
        // Update edges values
        
        self.edges._update(edges, width: width, color: color, dotted: dotted)
        
        // Update border appearance using new values
        
        update()
    }
    
    /// Updates properties for the specified corners
    public func update(corners: UIRectCorner = .allCorners, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        
        // Update corners values
        
        self.corners._update(corners, width: width, color: color, radius: radius, dotted: dotted)
        
        // Update border appearance using new values
        
        update()
    }
    
    /// Updates properties for the specified edges and/or corners
    public func update(edges: UIRectEdge, corners: UIRectCorner, width: CGFloat, color: UIColor, radius: CGFloat, dotted: Bool = false) {
        
        // Update edges values
        
        self.edges._update(edges, width: width, color: color, dotted: dotted)
        
        // Update corners values
        
        self.corners._update(corners, width: width, color: color, radius: radius, dotted: dotted)
        
        // Update border appearance using new values
        
        update()
    }
    
    // MARK: ************************************  ******************************************
}


