//
//  LoadingView.swift
//  loadingIcon
//
//  Created by Gyanesh Mittal on 20/01/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingView: UIView {
    
    var maximumValue: Double = 100.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var finishedPercentage:Double = 0.9 {
        didSet {
            if finishedPercentage > maximumValue {
                finishedPercentage = 1.0
            }
            else if finishedPercentage > 0.0 {
                finishedPercentage = finishedPercentage / maximumValue
            }
            else if finishedPercentage < 0.0 {
                finishedPercentage = fabs(finishedPercentage) / maximumValue
            }
            print (finishedPercentage)
            self.setNeedsDisplay()
        }
    }
    
    var scale: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var lineWidthFinished: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var lineWidthUnfinished: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var colorFinished: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable
    var colorUnfinished: UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var colorFill: UIColor = UIColor.grayColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var colorFillNeeded = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var rotation: Bool = true { // True For ClockWise False for anticlockwise
        didSet {
            setNeedsDisplay()
        }
    }
    
    var circleCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }
    
    var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) * scale / 2
    }
    
    
    override func drawRect(rect: CGRect) {
        
        let twoPI = 2 * M_PI
        
        let threeFourthOfTwoPI = M_PI + M_PI_2
        
        let startAngle: CGFloat = CGFloat(threeFourthOfTwoPI)
        var endAngle: CGFloat
        
        if rotation {
            endAngle = CGFloat(threeFourthOfTwoPI + (twoPI*finishedPercentage))
        }
        else {
            endAngle = CGFloat(threeFourthOfTwoPI - (twoPI*finishedPercentage))
        }
        
        // Unfinished Arc Path
        let arcFinished = UIBezierPath()
        
        arcFinished.addArcWithCenter(circleCenter, radius: circleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: rotation)
        
        arcFinished.lineWidth = lineWidthFinished
        colorFinished.setStroke()
        arcFinished.stroke()
        
        // Unfinished Arc Path
        let arcUnfinished = UIBezierPath()
        
        arcUnfinished.addArcWithCenter(circleCenter, radius: circleRadius, startAngle: endAngle, endAngle: startAngle, clockwise: rotation)
        
        arcUnfinished.lineWidth = lineWidthUnfinished
        colorUnfinished.setStroke()
        arcUnfinished.stroke()
        
        // To Fill Inside the Circle
        if colorFillNeeded {
            colorFill.setFill()
            arcUnfinished.fill()
            arcFinished.fill()
        }
    }

}
