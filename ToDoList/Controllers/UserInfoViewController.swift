//
//  UserInfoViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/26/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class UserInfoViewController: UITableViewController {
    
    var userInfoCells: [NSString] = ["Name", "Cellphone"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("userInfo", forIndexPath: indexPath) as UITableViewCell
    
        // Configure the cell...
        if indexPath.section == 0 {
            cell.textLabel?.text = userInfoCells[indexPath.row]
            var accessoryView = UILabel(frame: CGRectMake(0, 0, 80, 43))
            
            if indexPath.row == 0 {
                accessoryView.text = UserLocationManager.userLocationManager.getCurrentUserInfo().name
            } else {
                accessoryView.text = NSString(format: "+%i", UserLocationManager.userLocationManager.getCurrentUserInfo().cellphoneNumber)
            }
            
            accessoryView.font = UIFont(name: "Helvetica-Light", size: 15)
            accessoryView.textColor = UIColor.grayColor()
            
            cell.accessoryView = accessoryView
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
        } else {
            cell.textLabel?.text = "Change info"
        }
        
    
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "User Info"
        } else {
            return ""
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.section == 1 {
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            var alertController = UIAlertController(title: "Change User Info", message: "Select the option that better suites you", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            alertController.addAction(UIAlertAction(title: "Change cellphone number", style: UIAlertActionStyle.Default, handler: nil))
            alertController.addAction(UIAlertAction(title: "Change user name", style: UIAlertActionStyle.Default, handler: nil))
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}
