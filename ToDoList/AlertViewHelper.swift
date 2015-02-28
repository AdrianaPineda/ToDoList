//
//  AlertViewHelper.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/27/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class AlertViewHelper: NSObject, UIAlertViewDelegate{
    
    var alert: UIAlertView?
    var callback: (Int -> Void)?
    var inputCallback: ((Int, UITextField) -> Void)?
    
    func showAlertViewWithInput(title: NSString, message: NSString, cancelButtonTitle: NSString, otherButtonTitles: NSString, placeholder: NSString, callback:(buttonIndex: Int, textInput: UITextField) -> Void) -> UIView {
        
        var alertViewHelper = AlertViewHelper()
        alertViewHelper.inputCallback = callback
        alertViewHelper.alert = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: cancelButtonTitle, otherButtonTitles: otherButtonTitles)
        
        alertViewHelper.alert?.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alertViewHelper.alert?.textFieldAtIndex(0)?.placeholder = placeholder
        alertViewHelper.alert?.textFieldAtIndex(0)?.becomeFirstResponder()
        alertViewHelper.alert?.show()
        
        return alertViewHelper.alert!
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        NSLog("Item %d", buttonIndex)
        
        if inputCallback != nil {
            var textField = alertView.textFieldAtIndex(0)
            inputCallback!(buttonIndex, textField!)
        }
        
        if callback != nil {
            callback!(buttonIndex)
        }
    }
    
    
    
}
