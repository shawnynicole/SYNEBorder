//
//  +UIRectCorner.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UIRectCorner {
    
    // public static let none: UIRectCorner = UIRectCorner(rawValue: 0 << 0)
    
    public static let top: UIRectCorner = [.topLeft, .topRight]
    public static let bottom: UIRectCorner = [.bottomLeft, .bottomRight]
    public static let left: UIRectCorner = [.topLeft, .bottomLeft]
    public static let right: UIRectCorner = [.topRight, .bottomRight]
}


