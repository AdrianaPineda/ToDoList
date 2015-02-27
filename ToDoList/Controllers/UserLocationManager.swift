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
        userInfo.name = "Adriana"
        userInfo.cellphoneNumber = 123456
        
        return sharedInstance
    }
    
    override init() {
        super.init()
    }
    
    func loadUserLocationConfig() {
        
        var userInfoName = UsersDefaultManager.objectForKey("user_name") as NSString
        var userInfoCellphone = UsersDefaultManager.objectForKey("user_cellphone") as Int
        var listItemCount = UsersDefaultManager.objectForKey("list_item_count") as Int
        
        var listItems: [ListItem] = []
        var index: Int
        for index = 1; index <= listItemCount; ++index {
            
            var itemNum = NSString(format: "item_%d_", index)
            
            var itemName = UsersDefaultManager.objectForKey(itemNum + "_name") as NSString
            var itemAltitude = UsersDefaultManager.objectForKey(itemNum + "_altitude") as Double
            var itemLongitude = UsersDefaultManager.objectForKey(itemNum + "_longitude") as Double
            
            var currentListItem = ListItem()
            currentListItem.name = itemName
            
            var currentLocation = Location()
            currentLocation.latitude = itemAltitude
            currentLocation.longitude = itemLongitude
            
            currentListItem.location = currentLocation
            
            listItems.append(currentListItem)
        }
        
        userInfo.name = userInfoName
        userInfo.cellphoneNumber = userInfoCellphone
        userInfo.items = listItems
        
    }
    
    func getCurrentUserInfo() -> UserInfo{
        return userInfo
    }
    
    func updateUserInfo(name:NSString, cellphone:Int) -> Void {
        userInfo.name = name
        userInfo.cellphoneNumber = cellphone
        userInfo.items = []
        
        UsersDefaultManager.setObject(userInfo.name, forKey: "user_name")
        UsersDefaultManager.setObject(userInfo.cellphoneNumber, forKey: "user_cellphone")
        
    }
    
    func addLocationForUserInfo(listItem: ListItem) -> Void {
        userInfo.items.append(listItem)
        
        var numberOfLocations = userInfo.items.count
        var itemNum = NSString(format: "item_%d_", numberOfLocations)
        
        UsersDefaultManager.setObject(numberOfLocations, forKey:"list_item_count")
        UsersDefaultManager.setObject(listItem.name, forKey:(itemNum + "_name"))
        UsersDefaultManager.setObject(listItem.location.latitude, forKey:(itemNum + "_altitude"))
        UsersDefaultManager.setObject(listItem.location.longitude, forKey:(itemNum + "_longitude"))
    }
}
