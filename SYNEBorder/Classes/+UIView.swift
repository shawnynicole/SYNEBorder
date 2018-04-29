//
//  +UIView.swift
//  Border
//
//  Created by DeShawn Jackson on 4/27/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UIView {
    
    public var border: Border {
        
        let borderView: BorderView = {
            
            if let borderView = subviews.first(where: { $0 is BorderView }) as? BorderView { return borderView }
            
            let borderView = BorderView(frame: bounds)
            borderView.backgroundColor = .clear
            borderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.insertSubview(borderView, at: 0)
            
            return borderView
        }()
        
        return borderView.configuration
    }
}
