//
//  UserLocationManager.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/26/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import Foundation

private let sharedInstance = UserLocationManager()

private let userInfo: UserInfo = UserInfo()

class UserLocationManager: NSObject {
    
    class var userLocationManager: UserLocationManager {
        return sharedInstance
    }
    
    override init() {
        super.init()
    }
    
    func loadUserLocationConfig() {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var userInfoName = defaults.objectForKey("user_name") as NSString
        var userInfoCellphone = defaults.objectForKey("user_cellphone") as Int
        var listItemCount = defaults.objectForKey("list_item_count") as Int
        
        var listItems: [ListItem] = []
        var index: Int
        for index = 1; index <= listItemCount; ++index {
            
            var itemNum = NSString(format: "item_%d_", index)
            
            var itemName = defaults.objectForKey(itemNum + "_name") as NSString
            var itemAltitude = defaults.objectForKey(itemNum + "_altitude") as Double
            var itemLongitude = defaults.objectForKey(itemNum + "_longitude") as Double
            
            var currentListItem = ListItem()
            currentListItem.name = itemName
            
            var currentLocation = Location()
            currentLocation.altitude = itemAltitude
            currentLocation.longitude = itemLongitude
            
            currentListItem.location = currentLocation
            
            listItems.append(currentListItem)
        }
        
        userInfo.name = userInfoName
        userInfo.cellphoneNumber = userInfoCellphone
        userInfo.locations = listItems
        
    }
    
    func getCurrentUserInfo() -> UserInfo{
        return userInfo
    }
}
