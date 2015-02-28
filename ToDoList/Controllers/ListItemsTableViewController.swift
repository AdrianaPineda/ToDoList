//
//  ListItemsTableViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class ListItemsTableViewController: UITableViewController {

    var noRecordsLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var mainScreenSize = UIScreen.mainScreen().bounds.size
        noRecordsLabel = UILabel()
        noRecordsLabel?.frame = CGRectMake(16, 60, 150, 43)
        noRecordsLabel?.text = "No locations added"
        noRecordsLabel?.textColor = UIColor.grayColor()
        
        view.addSubview(noRecordsLabel!)
    }
    
    override func viewWillAppear(animated: Bool) {
        if UserLocationManager.userLocationManager.getCurrentNumberOfUserItems() == 0 {
            noRecordsLabel?.hidden = false
        } else {
            noRecordsLabel?.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if UserLocationManager.userLocationManager.getCurrentNumberOfUserItems() > 0 {
            return UserLocationManager.userLocationManager.getCurrentNumberOfUserItems()
        } else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listItem", forIndexPath: indexPath) as UITableViewCell

        var userItems = UserLocationManager.userLocationManager.getCurrentUserInfo().items
        
        if userItems.count > 0 {
            var index = indexPath.row
            var currentItem = userItems[index]
            var userLocation = currentItem.location
            
            // Configure the cell...
            cell.textLabel?.text = NSString(format: "%d, %d", userLocation.latitude, userLocation.longitude)
        } else {
            cell.textLabel?.text = "No locations added"
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        }

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Locations"
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            UserLocationManager.userLocationManager.deleteListItemAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
