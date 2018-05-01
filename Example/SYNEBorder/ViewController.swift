//
//  ViewController.swift
//  SYNEBorder
//
//  Created by shawnynicole on 04/28/2018.
//  Copyright (c) 2018 shawnynicole. All rights reserved.
//

import UIKit
import SYNEBorder

class ViewController: UIViewController {

    // MARK: ************************************  ******************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let x: CGFloat = 100
        let space: CGFloat = 25
        let width: CGFloat = 200
        let height: CGFloat = 125
        let color = UIColor(white: 0.97, alpha: 1)
        
        let view1 = createView(color: color, frame: CGRect(x: x, y:  space, width: width, height: height))
        let view2 = createView(color: color, frame: CGRect(x: x, y: view1.frame.maxY + space, width: width, height: height))
        let view3 = createView(color: color, frame: CGRect(x: x, y: view2.frame.maxY + space, width: width, height: height))
        let view4 = createView(color: color, frame: CGRect(x: x, y: view3.frame.maxY + space, width: width, height: height))
        
        // View 1
        
        // Note: Using view1.border creates a new border reference if one does not exist.
        // To check if a border exists without creating a border reference, use:
        if view1.hasBorder {
            // view does have a border
        } else {
            // view does not have a border
        }
        
        view1.border.update(edges: .all, corners: .allCorners, width: 1, color: .black, radius: 20, dotted: true)
        view1.border.update(corners: .allCorners, width: 0, color: .clear, radius: 20)
        view1.border.update(edges: .all, width: 1, color: .blue, dotted: true)
        
        // To hide the border without removing it, use:
        // view1.border.isHidden = true
        
        // To change the border's alpha value, use:
        // view1.border.alpha = 0.5
        
        // To create a copy of the border, use:
        let newBorder = view1.border.copy()
        // This will change the width of newBorder but will not change the width of view1.border.
        newBorder.width = 5
        
        // To apply the new border to the view, use:
        // view1.border = newBorder
        
        /*
        // Create and configure a new border
        let border = Border()
        border.width = 1
        border.color = .black

        // Setting the border removes the old border and applies the new border's settings
        view1.border = border
        */
        
        // To remove the border, uncomment this line
        // view1.border.remove()
        
        /*
        // Create and configure a new border using `BorderEdges` and `BorderCorners`.
        let border: Border = {
            
            let edges = BorderEdges()
            edges.top.width = 1
            edges.top.color = .black
            
            let corners = BorderCorners()
            corners.update(.bottom, width: 1, color: .green, radius: 40)
            
            let border = Border(edges: edges, corners: corners)
            
            return border
        }()
        
        // Setting the border removes the old border and applies the new border's settings
        view1.border = border
        */
        
        // View 2
        
        view2.border.update(edges: .top, width: 3, color: .red)
        view2.border.update(corners: .topRight, width: 3, color: .orange, radius: 40, dotted: true)
        view2.border.update(edges: .right, width: 3, color: .yellow)
        view2.border.update(corners: .bottomRight, width: 3, color: .green, radius: 10)
        view2.border.update(edges: .bottom, width: 3, color: .blue)
        view2.border.update(corners: .bottomLeft, width: 3, color: .magenta, radius: 10)
        view2.border.update(edges: .left, width: 3, color: .purple)
        
        let topLeft = view2.border.corners.topLeft
        topLeft.width = 3
        topLeft.color = .brown
        topLeft.radius = 20
        topLeft.dotted = true
        
        // View 3
        
        view3.border.update(corners: .allCorners, width: 10, color: .blue, radius: 40)
        
        // View 4
        
        view4.border.update(edges: .all, width: 5, color: .green)
        view4.border.update(corners: [.bottomLeft], width: 0, color: .clear, radius: 10)
        view4.border.update(corners: [.topLeft, .bottomRight], width: 5, color: .green, radius: 40)
        view4.border.edges.top.width = 0
    }

    // MARK: ************************************  ******************************************

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ************************************  ******************************************

    func createView(color: UIColor, frame: CGRect) -> UIView {
        
        let view = UILabel(frame: frame)
        
        view.text = "pan to resize"
        view.textAlignment = .center
        view.isUserInteractionEnabled = true
        
        view.backgroundColor = color
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        view.addGestureRecognizer(gesture)
        
        self.view.addSubview(view)
        
        return view
    }
    
    // MARK: ************************************  ******************************************
    
    @objc func pan(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            
        case .began, .changed, .ended, .cancelled:
            
            let view = sender.view
            
            let translation = sender.translation(in: view)
            sender.setTranslation(.zero, in: view)
            
            view?.frame.size.width += translation.x
            view?.frame.size.height += translation.y
            
        default: break
        }
    }

    // MARK: ************************************  ******************************************
}

