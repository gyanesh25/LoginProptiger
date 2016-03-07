//
//  File.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 11/02/16.
//

import UIKit
import DGActivityIndicatorView

@IBDesignable
class IndicatorView: UIView
{
    //MARK:- variable declarations
    
    private var dgActivityIndicator: DGActivityIndicatorView?
    
    private var dgActivityIndicatortype: DGActivityIndicatorAnimationType?
    {
        didSet
        {
            updateIndicatorSettings()
        }
    }
    private var indicatorColor: UIColor?
    {
        didSet
        {
            updateIndicatorSettings()
        }
    }
    private var indicatorCenter: CGPoint?
    {
        didSet
        {
            updateIndicatorSettings()
        }
    }
    private var indicatorSize: CGFloat?
        {
        didSet
        {
            updateIndicatorSettings()
        }
    }
    override var center: CGPoint
    {
        didSet
        {
            updateIndicatorSettings()
        }
    }
    
    //MARK:- init func declarations
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.initializeDGActivityIndicatorView()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    convenience init(frame: CGRect?, bgColor: UIColor?)
    {
        if let frame = frame
        {
            self.init(frame: frame)
        }
        else
        {
            self.init(frame: CGRect())
        }
        self.backgroundColor = bgColor
    }
    
    
    //MARK:- override func
    
    override func layoutSubviews()
    {
        updateIndicatorSettings()
    }
    

    //MARK:- user functions
    
    private func updateIndicatorSettings()
    {
        self.dgActivityIndicator?.type = self.dgActivityIndicatortype ?? DGActivityIndicatorAnimationType.BallPulse
        self.dgActivityIndicator?.tintColor = self.indicatorColor ?? UIColor.redColor()
        self.dgActivityIndicator?.center = self.indicatorCenter ?? CGPoint(x: bounds.midX, y: bounds.midY)
        self.dgActivityIndicator?.size = self.indicatorSize ?? CGFloat(45)
        setNeedsDisplay()
    }
    
    private func initializeDGActivityIndicatorView ()
    {
        self.dgActivityIndicator = DGActivityIndicatorView()
        addSubview(self.dgActivityIndicator!)
        self.dgActivityIndicator?.hidden = true
        self.hidden = false
        updateIndicatorSettings()
    }
    
    func changeDGActivityIndicatorType (type: DGActivityIndicatorAnimationType?, tintColor: UIColor?)
    {
        self.dgActivityIndicatortype = type
        self.indicatorColor = tintColor
    }
    
    func changeIndicatorPosition (center: CGPoint?)
    {
        if let center = center
        {
            self.indicatorCenter = center
        }
    }
    
    func changeIndicatorSize (size: CGFloat?)
    {
        if let size = size
        {
            self.indicatorSize = size
        }
    }
    
    func startAnimating ()
    {
        if self.dgActivityIndicator == nil
        {
            self.initializeDGActivityIndicatorView()
        }
        self.dgActivityIndicator?.hidden = false
        self.hidden = false
        dgActivityIndicator!.startAnimating()
    }
    
    func stopAnimating ()
    {
        if let dgActivityIndicator = self.dgActivityIndicator
        {
            dgActivityIndicator.stopAnimating()
            self.dgActivityIndicator?.hidden = true
            self.hidden = true
        }
    }
    
}