//
//  +UIView.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Get/set the border. If no border exists, an empty border configuration is created. To check if a border exists without creating one, use `hasBorder`.
    public var border: Border {
        get { return _borderView.configuration }
        set { self._borderView.setConfiguration(newValue) }
    }
    
    /// Checks if the view has a `Border`.
    public var hasBorder: Bool {
        return subviews.contains(where: { $0 is BorderView })
    }
    
    /// Returns the view's borderView. If one does not exist, a new one is created. To check if a borderView exists without creating one, use `hasBorder`.
    internal var _borderView: BorderView {
        
        let borderView: BorderView = {
            
            if let borderView = subviews.first(where: { $0 is BorderView }) as? BorderView { return borderView }
            
            let borderView = BorderView(frame: bounds)
            borderView.backgroundColor = .clear
            borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.insertSubview(borderView, at: 0)
            
            return borderView
        }()
        
        return borderView
    }
}
