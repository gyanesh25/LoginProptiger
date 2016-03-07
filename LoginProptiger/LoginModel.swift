//
//  LoginModel.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 22/01/16.
//

import Foundation
import Alamofire

struct loginUrl {
    static let notificaton = "Login Successful Notification"
    static let key = "Login Notification Key"
}

class loginModel {
    
    func loginCheck (username username: String?, password: String?) -> String {
        if username != "" {
            if password != "" {
                let parameters = [
                    "username": username!,
                    "password": password!
                ]
                let request = Alamofire.request(.POST, "https://www.proptiger.com/app/v1/login", parameters: parameters)
                request.responseJSON { response in
                    let center = NSNotificationCenter.defaultCenter()
                    let notification = NSNotification(name: loginUrl.notificaton, object: nil, userInfo: [loginUrl.key: response.result.value ?? ""])
                    center.postNotification(notification)
                }
                return ""
            }
            else {
                return "Enter Password"
            }
        }
        else {
            return "Enter Username"
        }
    }
    
}