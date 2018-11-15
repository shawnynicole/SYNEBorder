//
//  BorderView.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 All rights reserved.
//

import UIKit

internal class BorderView: UIView {
    
    // MARK: ************************************  ******************************************
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init() {
        self.init(frame: .zero)
        commonInit()
    }
    
    func commonInit() {
        isUserInteractionEnabled = false
    }
    
    // MARK: ************************************  ******************************************

    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
                
        updateBorderLayer()
    }
    
    // MARK: ************************************  ******************************************

    internal func remove() {
        // Remove masking
        superview?.layer.mask = nil
        
        // Remove border view
        removeFromSuperview()
    }
    
    // MARK: ************************************  ******************************************
    
    internal func setConfiguration(_ border: Border) {
        
        // Remove old border's layers
        self.layer.sublayers?.removeAll()
        
        // Assign new border's borderView
        border.borderView = self
        
        // Assign new border
        self.configuration = border
        
        // Update the border's appearance using new border
        self.updateBorderLayer()
    }

    internal private(set) lazy var configuration: Border = {
        
        let border = Border(self)
        
        self.backgroundColor = .clear
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       
        return border
    }()

    // MARK: ************************************  ******************************************

    internal func update() {
        updateBorderLayer()
    }
    
    // MARK: ************************************  ******************************************

    /// Without the widthOffset, borders appear thinner than requested.
    private let widthOffset: CGFloat = 1
    
    // MARK: ************************************  ******************************************
    
    private func updateBorderLayer() {
        
        let rect = bounds //FIXME: .insetBy(dx: inset.x, dy: inset.y)
        let edges = configuration.edges
        let corners = configuration.corners
        let maskPath = UIBezierPath()
        
        // Drawing start/end points
        
        let topLeftRadius = corners.topLeft.radius
        let topRightRadius = corners.topRight.radius
        let bottomRightRadius = corners.bottomRight.radius
        let bottomLeftRadius = corners.bottomLeft.radius
        
        let topLeft = CGPoint(x: rect.origin.x + topLeftRadius, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX - topRightRadius, y: rect.minY)
        
        let rightTop = CGPoint(x: rect.maxX, y: rect.minY + topRightRadius)
        let rightBottom = CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius)
        
        let bottomRight = CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY)
        
        let leftBottom = CGPoint(x: rect.minX, y: rect.maxY - bottomLeftRadius)
        let leftTop = CGPoint(x: rect.minX, y: rect.minY + topLeftRadius)
        
        let topLeftCorner = rect.origin
        let topRightCorner = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRightCorner = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeftCorner = CGPoint(x: rect.minX, y: rect.maxY)
        
        func updateLayer(_ layer: CAShapeLayer, path: CGPath?, width: CGFloat, color: UIColor, dotted: Bool) {
            
            layer.frame = rect
            layer.path = path
            layer.lineWidth = width
            layer.backgroundColor = UIColor.clear.cgColor
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = color.cgColor
            layer.lineDashPattern = !dotted ? nil : {
                let dashWidth = NSNumber(value: Float(width))
                let dashSpace = NSNumber(value: 2)
                return [dashWidth, dashSpace]
                }()
        }
        
        func addEdge(_ edge: BorderEdge, to point: CGPoint) {

            let currentPoint = maskPath.currentPoint
            
            // Mask
            
            maskPath.addLine(to: point)
            
            // Border
            
            let path: CGPath? = {
                
                if edge.width > 0 && edge.color != .clear {
                    
                    let borderPath = UIBezierPath()
                    borderPath.move(to: currentPoint)
                    borderPath.addLine(to: point)
                    
                    return borderPath.cgPath
                }
                
                return nil
            }()
            
            let layer = edge.layer
            let width = edge.width + widthOffset
            let color = edge.color
            let dotted = edge.dotted
            
            updateLayer(layer, path: path, width: width, color: color, dotted: dotted)
            
        }
        
        func addCorner(_ rectCorner: BorderCorner, corner: CGPoint, to point: CGPoint) {
            
            let currentPoint = maskPath.currentPoint
            
            // Mask
            
            maskPath.addQuadCurve(to: point, controlPoint: corner)
            
            // Border
            
            let path: CGPath? = {
                
                if rectCorner.width > 0 && rectCorner.color != .clear && rectCorner.radius > 0 {
                    
                    let borderPath = UIBezierPath()
                    borderPath.move(to: currentPoint)
                    borderPath.addQuadCurve(to: point, controlPoint: corner)
                    
                    return borderPath.cgPath
                }
                
                return nil
            }()
            
            let layer = rectCorner.layer
            let width = rectCorner.width + widthOffset
            let color = rectCorner.color
            let dotted = rectCorner.dotted
            
            updateLayer(layer, path: path, width: width, color: color, dotted: dotted)
            
        }
        
        // initial
        maskPath.move(to: topLeft)
        
        // top edge
        addEdge(edges.top, to: topRight)
        
        // top right corner
        addCorner(corners.topRight, corner: topRightCorner, to: rightTop)
        
        // right edge
        addEdge(edges.right, to: rightBottom)
        
        // bottom right corner
        addCorner(corners.bottomRight, corner: bottomRightCorner, to: bottomRight)
        
        // bottom edge
        addEdge(edges.bottom, to: bottomLeft)
        
        // bottom left corner
        addCorner(corners.bottomLeft, corner: bottomLeftCorner, to: leftBottom)
        
        // left edge
        addEdge(edges.left, to: leftTop)
        
        // top left corner
        addCorner(corners.topLeft, corner: topLeftCorner, to: topLeft)
        
        
        // Mask the superview to the specified corner radii
        
        if let superview = superview {
            
            let superviewMaskLayer: CAShapeLayer = {
                
                if let superviewMaskLayer = superview.layer.mask as? CAShapeLayer {
                    return superviewMaskLayer
                }
                
                let superviewMaskLayer = CAShapeLayer()
                superview.layer.mask = superviewMaskLayer
                
                return superviewMaskLayer
            }()
            
            superviewMaskLayer.path = maskPath.cgPath
        }
    }
    
    // MARK: ************************************  ******************************************
}


