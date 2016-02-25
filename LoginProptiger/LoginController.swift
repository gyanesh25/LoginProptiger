//
//  LoginController.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 22/01/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import UIKit

let defaults = NSUserDefaults.standardUserDefaults()

class LoginController: UIViewController {

    let loginModelClass = loginModel()
    var indicatorView: IndicatorView?
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var displayResult: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var testImageView: UIImageView!
    
    @IBAction func formatTextFunction(sender: PtCommaTextFeild) {
        sender.getFormattedTextFromString()
    }
    
    @IBAction func loginUser(sender: AnyObject) {
        indicatorView?.startAnimating()
        displayResult.text! = loginModelClass.loginCheck(username: username.text, password: password.text)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.destinationViewController as? ProptigerSearchViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                    case "LoginSuccessful": print("Login Successful")
                    default: print("Nothing Happens")
                }
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        indicatorView = IndicatorView()
        self.view.addSubview(indicatorView!)
        indicatorView?.changeIndicatorPosition(self.view.center)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserverForName(loginUrl.notificaton, object: nil, queue: NSOperationQueue.mainQueue()) { notification in
            
            self.indicatorView?.stopAnimating()
            
            if let value = notification.userInfo?[loginUrl.key] {
                if let data = value["data"] as? NSDictionary
                {
                    let userDataRequired: [String: AnyObject]
                    userDataRequired = [
                                        "contactNumber": data["contactNumber"]!,
                                        "firstName": data["firstName"]!,
                                        "email": data["email"]!,
                                        "id": data["id"]!
                                        ]
                    defaults.setObject(userDataRequired, forKey: "userInfo")
//                    self.performSegueWithIdentifier("LoginSuccessful", sender: nil)
                }
                else
                {
                    print ("No Data")
                }
            }
        }
        
        
        Utility.downloadProfileImageAndSaveToStorage("https://robohash.org/123.png", name: "asmdbs.png")
        NSNotificationCenter.defaultCenter().addObserverForName("ProfileImageDownloaded", object: nil, queue: NSOperationQueue.mainQueue()) {
            notification in
            self.testImageView.image = Utility.getImageFromStorage("asmdbs.png")
        }
    }

}

