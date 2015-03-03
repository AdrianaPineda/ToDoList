//
//  UsersDefaultManager.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/26/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import Foundation

class UsersDefaultManager {
    
    class func setObject(value: AnyObject, forKey key: NSString) -> Void {
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
        
        defaults.synchronize()
    }
    
    class func objectForKey(key: NSString) -> AnyObject! {
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        return defaults.objectForKey(key)?
    }
    
    class func removeObjectForKey(key: NSString) -> Void {
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(key)
        
        defaults.synchronize()
    }
    
    class func resetUserDefaults() -> Void {
        var appDomain = NSBundle.mainBundle().bundleIdentifier
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.removePersistentDomainForName(appDomain!)
    }
}