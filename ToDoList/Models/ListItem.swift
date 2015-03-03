//
//  ListItem.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class ListItem: NSObject {
    
    var numberId: Int = 0
    var name: NSString = ""
    var cellphoneNumber: NSNumber = 0
    var location: Location = Location()
    var lastReminder: NSDate?
    var message: NSString = ""
    
    func isLocationNearCurrentLocation(latitude: Double, longitude: Double) -> Bool {
        
        var R: Double = 6373
        var phi1 = getRadians(latitude)
        var phi2 = getRadians(location.latitude)
        var lambda1 = getRadians(location.latitude - latitude)
        var lambda2 = getRadians(location.longitude - longitude)
        
        var a = sin(lambda1/2)*sin(lambda1/2) + cos(phi1)*cos(phi2)*sin(lambda2/2)*sin(lambda2/2)
        var c: Double = 2*atan2(sqrt(a), sqrt(1-a))
        
        var d = R*c
        
        if d < 2 {
            return true
        } else {
            return false
        }
        
    }
    
    func getRadians(degrees: Double) -> Double {
        return degrees*(M_PI/180)
    }
    
    func updateLastReminder() -> Void {
        lastReminder = NSDate()
    }
    
    func shouldSendReminder() -> Bool {
        
        var currentDate = NSDate()
        var currentDiff = currentDate.timeIntervalSinceNow
        
        if (lastReminder != nil) {
            var lastReminderDiff = lastReminder?.timeIntervalSinceNow
            
            var differenceInSeconds = currentDiff - lastReminderDiff!
            var differenceInMinutes = differenceInSeconds/60
            var differenceInHours = differenceInMinutes/60
            
            if differenceInHours < 5 {
                return false
            }
            
        } else {
            updateLastReminder()
        }
        
        return true
    }
    
}