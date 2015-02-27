//
//  MapViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var firstLoad: Bool = true
    
    @IBOutlet weak var addLocation: UIBarButtonItem!
    @IBOutlet weak var mapView : MKMapView?
    var theCoordinate: CLLocationCoordinate2D?
    var locationManager: CLLocationManager?
    
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
        
    }
    
    // MARK: MapView Delegate
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        if firstLoad {
            mapView.centerCoordinate = userLocation.location.coordinate
            firstLoad = false
        }
        
    }
    
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        var centerLocation: CLLocationCoordinate2D = mapView.centerCoordinate
        var location: CLLocation = CLLocation(latitude: centerLocation.latitude, longitude: centerLocation.longitude)
        
//        NSLog("Location %@", location)
    }
    
    // MARK: UIButton actions
    @IBAction func addLocation(sender: AnyObject) {
        
        var centerLocation: CLLocationCoordinate2D = mapView!.centerCoordinate
        var location: CLLocation = CLLocation(latitude: centerLocation.latitude, longitude: centerLocation.longitude)
        
        
        
        NSLog("Location %@", location)
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
