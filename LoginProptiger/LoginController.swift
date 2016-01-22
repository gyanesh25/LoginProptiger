//
//  LoginController.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 22/01/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let loginModelClass = loginModel()
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var displayResult: UILabel!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginUser(sender: AnyObject) {
        displayResult.text! = loginModelClass.loginCheck(username: username.text, password: password.text)
    }

}
