//
//  MessageManager.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/27/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class MessageManager: NSObject {
    
    class func sendMessage(message: NSString, cellphoneNumber: NSNumber) -> Void {
        
        //Call to backend
        var address: NSString = "http://29af880b.ngrok.com/set-location"
        var url: NSURL = NSURL(string: address)!
        
        var request:ASIFormDataRequest = ASIFormDataRequest.requestWithURL(url) as ASIFormDataRequest
        
        request.setPostValue(cellphoneNumber, forKey: "call_receiver")
        request.setPostValue(message, forKey: "location_message")
        
        request.startAsynchronous()
        
//        NSLog("STATUS %d", request.responseStatusCode)
//        if request.error != nil && request.responseStatusCode != 401 {
//            NSLog("ERROR")
//            NSLog(request.error.localizedDescription)
//        }
//        
//        var body = request.responseString()
        //        NSLog(parseBodyAsJSON(body))
    }
    
    class func parseBodyAsJSON(json: NSString) -> NSString {
        
        var jsonData = json.dataUsingEncoding(NSUTF8StringEncoding)
        var error: NSError?
        var jsonObj = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSString
        
        return jsonObj
    }
    
    
    //    (id) parseBodyAsJSON {
    //    if(self.jsonObject) {
    //    return self.jsonObject;
    //    }
    //
    //    self.jsonObject = [self.body JSONObject];
    //    if([self.jsonObject isKindOfClass: [NSDictionary class]]) {
    //    self.message = [self.jsonObject objectForKey:@"message"];
    //    }
    //
    //    return self.jsonObject;
    //    }
}