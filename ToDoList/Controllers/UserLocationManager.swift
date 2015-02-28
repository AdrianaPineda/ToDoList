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
        initUserNameAndCellphone()
        loadUserLocationConfig()
    }
    
    func initUserNameAndCellphone() {
        
        UsersDefaultManager.setObject("Adriana", forKey: "user_name")
        UsersDefaultManager.setObject(123456, forKey: "user_cellphone")
        
        if UsersDefaultManager.objectForKey("list_item_count") == nil {
            UsersDefaultManager.setObject(0, forKey: "list_item_count")
        }
        
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
        
        // Show confirmation alert message
        
        
        userInfo.items.append(listItem)
        
        var numberOfLocations = userInfo.items.count
        var itemNum = NSString(format: "item_%d_", numberOfLocations)
        
        UsersDefaultManager.setObject(numberOfLocations, forKey:"list_item_count")
        UsersDefaultManager.setObject(listItem.name, forKey:(itemNum + "_name"))
        UsersDefaultManager.setObject(listItem.location.latitude, forKey:(itemNum + "_altitude"))
        UsersDefaultManager.setObject(listItem.location.longitude, forKey:(itemNum + "_longitude"))
    }
    
    func getCurrentNumberOfUserItems() -> Int {
        return userInfo.items.count
    }
    
    func deleteListItemAtIndex(index: Int) -> Void {
        
        userInfo.items.removeAtIndex(index)
        
        var numberOfLocations = userInfo.items.count
        var itemNum = NSString(format: "item_%d_", (index+1))
        
        UsersDefaultManager.setObject(numberOfLocations, forKey:"list_item_count")
        UsersDefaultManager.removeObjectForKey(itemNum + "_name")
        UsersDefaultManager.removeObjectForKey(itemNum + "_altitude")
        UsersDefaultManager.removeObjectForKey(itemNum + "_longitude")
    }
    
    func checkForLocationsNearBy(currentLatitude: Double, currentLongitude: Double) -> Void {
        var locations: [ListItem] = locationsNearBy(currentLatitude, currentLongitude: currentLongitude) as [ListItem]
        
        if locations.count > 0 {
            //SEND Messages
        }
    }
    
    func locationsNearBy(currentLatitude: Double, currentLongitude: Double) -> [ListItem] {
        
        var itemsNearBy: [ListItem] = []
        var index = 0
        for (index; index < userInfo.items.count; ++index) {
            
            var currentItem = userInfo.items[index]
            var locationIsNearBy = currentItem.isLocationNearCurrentLocation(currentLatitude, longitude: currentLongitude)
            
            if locationIsNearBy {
                //Send SMS???
                itemsNearBy.append(currentItem)
            }
        }
        
        return itemsNearBy
    }
}
