//
//  LocationDetailViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 3/2/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var cellphoneNumber: UITextField!
    
    var selectedItemIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var selectedListItem: ListItem = UserLocationManager.userLocationManager.getCurrentUserInfo().items[selectedItemIndex]
        name.text = selectedListItem.name
        cellphoneNumber.text = "+" + selectedListItem.cellphoneNumber.stringValue
        message.text = selectedListItem.message
        
        //Add gesture recognizer
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateLocation(sender: AnyObject) {
//        UserLocationManager.userLocationManager.updateLocationInfo(selectedItemIndex, name: name.text, message: message.text, cellphoneNumber: cellphoneNumber.text.toInt()!)
    }

    func dismissKeyboard() {
        name.resignFirstResponder()
        message.resignFirstResponder()
        cellphoneNumber.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
