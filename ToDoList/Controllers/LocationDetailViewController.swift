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
    
    @IBOutlet weak var updateLocation: UIButton!
    
    var selectedItemIndex: Int = -1
    var selectedListItem: ListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        name.text = selectedListItem!.name
        cellphoneNumber.text = "+" + selectedListItem!.cellphoneNumber.stringValue
        message.text = selectedListItem!.message
        
        //Add gesture recognizer
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateLocation(sender: AnyObject) {
/*
        selectedListItem!.name = name.text
        selectedListItem!.message = message.text
        selectedListItem!.cellphoneNumber = cellphoneNumber.text.toInt()!
        
        UserLocationManager.userLocationManager.updateLocationInfo(selectedItemIndex, name: name.text, message: message.text, cellphoneNumber: cellphoneNumber.text.toInt()!)
        
        var alertViewSuccessful = UIAlertController(title: "Change location", message: "Location updated successfully", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertViewSuccessful.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alertAction) -> Void in
            self.popToPreviousController()
        }))
        
        presentViewController(alertViewSuccessful, animated: true, completion: nil)
*/        
    }

    func dismissKeyboard() {
        name.resignFirstResponder()
        message.resignFirstResponder()
        cellphoneNumber.resignFirstResponder()
    }
    
    func popToPreviousController() -> Void {
        navigationController?.popViewControllerAnimated(true)
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
