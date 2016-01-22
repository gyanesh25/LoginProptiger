//
//  LoginModel.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 22/01/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import Foundation
import Alamofire

class loginModel {
    
    func loginCheck (username username: String?, password: String?) -> String {
        if username != "" {
            if password != "" {
                let parameters = [
                    "username": username!,
                    "password": password!
                ]
                let request = Alamofire.request(.POST, "https://www.proptiger.com/app/v1/login", parameters: parameters)
                request.responseJSON { response in print("Response JSON: \(response.result.value)")
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