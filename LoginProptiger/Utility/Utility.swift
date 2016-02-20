//
//  Utility.swift
//  LoginProptiger
//
//  Created by Gyanesh Mittal on 17/02/16.
//  Copyright © 2016 Proptiger. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Utility: NSObject
{
    class func downloadProfileImageAndSaveToStorage (profilePhotoUrl: String, name: String)
    {
        Alamofire.request(.GET, profilePhotoUrl)
            .response {
                (resuest, respones, data, error) -> Void in
                
                let fileManager = NSFileManager.defaultManager()
                let documentURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
                let filePath = documentURL.path! + name
                if fileManager.fileExistsAtPath(filePath)
                {
                    do
                    {
                        try fileManager.removeItemAtPath(filePath)
                    }
                    catch{}
                }
                if fileManager.createFileAtPath(filePath, contents: data, attributes: nil) {}
                let center = NSNotificationCenter.defaultCenter()
                let notification = NSNotification(name: "ProfileImageDownloaded", object: nil, userInfo: nil)
                center.postNotification(notification)
        }
    }
    
    class func getImageFromStorage (path: String) -> UIImage?
    {
        let fileManager = NSFileManager.defaultManager()
        let documentURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        let filePath = documentURL.path! + path
        return UIImage(contentsOfFile: filePath)
    }
}