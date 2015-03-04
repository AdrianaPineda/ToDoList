//
//  MapViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UIAlertViewDelegate {

    var firstLoad: Bool = true
    
    @IBOutlet weak var addLocation: UIBarButtonItem!
    @IBOutlet weak var mapView : MKMapView?
    var theCoordinate: CLLocationCoordinate2D?
    var locationManager: CLLocationManager?
    
    var currentAlertView: UIAlertView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        if (locationManager?.respondsToSelector("requestWhenInUseAuthorization") != nil) {
            locationManager?.requestWhenInUseAuthorization()
        }
        
        locationManager?.startUpdatingLocation()
        
        //Set delegate
        mapView?.delegate = self

    }
    
    override func viewWillAppear(animated: Bool) {
        var currentLocation = mapView?.userLocation
        var coordinate = currentLocation?.coordinate
        var zoomLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
        
        var viewRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*1609.344, 0.5*1609.344)
        
        mapView?.setRegion(viewRegion, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        NSLog("Location %@", locations)
        var currentLocation = mapView?.userLocation
        var coordinate = currentLocation?.coordinate
    }
    
    // MARK: MapView Delegate
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        if firstLoad {
            mapView.centerCoordinate = userLocation.location.coordinate
            firstLoad = false
        } else {
            var centerLocation: CLLocationCoordinate2D = mapView.centerCoordinate
            
            UserLocationManager.userLocationManager.checkForLocationsNearBy(centerLocation.latitude, currentLongitude: centerLocation.longitude)
        }
        
    }
    
//    @IBAction func resetLocations(sender: AnyObject) {
//        UserLocationManager.userLocationManager.resetLocations()
//    }
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
//        var centerLocation: CLLocationCoordinate2D = mapView.centerCoordinate
//        
//        var alertViewSuccessful = UIAlertController(title: "Location Changed", message: "Location added successfully", preferredStyle: UIAlertControllerStyle.Alert)
//        alertViewSuccessful.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        presentViewController(alertViewSuccessful, animated: true, completion: nil)
//        
//        UserLocationManager.userLocationManager.checkForLocationsNearBy(centerLocation.latitude, currentLongitude: centerLocation.longitude)
    }
    
    // MARK: UIButton actions
    @IBAction func addLocation(sender: AnyObject) {

        //Show alert view
        showAlertView()

    }

    func showAlertView() -> Void {
        var alertView = UIAlertView(title: "Add location", message: "Please add location name", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Add location")
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alertView.textFieldAtIndex(0)?.placeholder = "Location Name"
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {
            NSLog("Add location")
            
            var locationName = alertView.textFieldAtIndex(0)?.text
            
            if locationName != "" {
                addLocation(locationName!)
                
                var alertViewSuccessful = UIAlertController(title: "Add location", message: "Location added successfully", preferredStyle: UIAlertControllerStyle.Alert)
                alertViewSuccessful.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                presentViewController(alertViewSuccessful, animated: true, completion: nil)
            } else {
                showAlertView()
            }
        }
    }
    
    func addLocation(locationName: NSString) -> Void {
        var centerLocation: CLLocationCoordinate2D = mapView!.centerCoordinate
        var location: CLLocation = CLLocation(latitude: centerLocation.latitude, longitude: centerLocation.longitude)
        
        var currentUserInfo: UserInfo = UserLocationManager.userLocationManager.getCurrentUserInfo()
        
        var listItem = ListItem()
        listItem.name = locationName
        listItem.message = locationName
        listItem.cellphoneNumber = currentUserInfo.cellphoneNumber
        
        var listItemLocation = Location()
        listItemLocation.latitude = centerLocation.latitude
        listItemLocation.longitude = centerLocation.longitude
        
        listItem.location = listItemLocation
        
        UserLocationManager.userLocationManager.addLocationForUserInfo(listItem)
    }
    
//
//    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
//        <#code#>
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
