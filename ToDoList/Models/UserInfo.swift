//
//  UserInfo.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    var name: NSString = ""
    var cellphoneNumber: Int = 0
    var items: [ListItem] = []
    
    func getCellphoneNumberWithFormat() -> NSString {
        return NSString(format: "+%@", cellphoneNumber)
    }
   
}
