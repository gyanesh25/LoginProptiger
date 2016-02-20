//
//  PtCommaTextFeild.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 09/02/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import UIKit

class PtCommaTextFeild: UITextField {
    
    override var text: String? {
        get {
            return (super.text!.stringByReplacingOccurrencesOfString(",", withString: "") as String?)
        }
        set(newValue) {
            super.text! = newValue!
        }
    }
    
    func getFormattedTextFromString ()
    {
        if let text = Int(self.text!) {
            let formatter = NSNumberFormatter()
            formatter.groupingSeparator = ","
            formatter.groupingSize = 3
            formatter.numberStyle = .DecimalStyle
            super.text! = formatter.stringFromNumber(text)!
        }
        else {
            super.text! = super.text!
        }
    }

}
