//
//  File.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 11/02/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import UIKit

@IBDesignable
class IndicatorView: UIView {
    
    var cir = UIBezierPath()
    
    @IBInspectable
    var circleRadius: CGFloat = 3
    {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var circleCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.superview?.hidden = true
        configure()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configure()
    }
    
    func configure() {
        backgroundColor = UIColor.whiteColor()
    }
    
}