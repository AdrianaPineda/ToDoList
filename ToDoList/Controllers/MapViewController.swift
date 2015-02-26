//
//  MapViewController.swift
//  ToDoList
//
//  Created by Adriana Pineda on 2/25/15.
//  Copyright (c) 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView : MKMapView?
    var theCoordinate: CLLocationCoordinate2D?
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load google maps view
//        var camera = GMSCameraPosition.cameraWithLatitude(-33.868,
//            longitude:151.2086, zoom:6)
//        mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
//        mapView?.settings.compassButton = true
//        mapView?.settings.myLocationButton = true
//        
//        var marker = GMSMarker()
//        marker.position = camera.target
//        marker.snippet = "Hello World"
//        marker.appearAnimation = kGMSMarkerAnimationPop
//        marker.map = mapView
//        
//        self.view = mapView
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        if (locationManager?.respondsToSelector("requestWhenInUseAuthorization") != nil) {
            locationManager?.requestWhenInUseAuthorization()
        }
        
        locationManager?.startUpdatingLocation()
        
        mapView?.region.span.latitudeDelta = 0.005
        mapView?.region.span.longitudeDelta = 0.005
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        NSLog("Location %@", locations)
        
    }
    
//    func showAnotation() -> Void {
//        var region: MKCoordinateRegion?
//        region?.center = theCoordinate!
//        
//        var span:MKCoordinateSpan?
//        span?.latitudeDelta = 0.005
//        span?.longitudeDelta = 0.005
//        
//        region?.span = span!
//        
//        mapView?.setRegion(region!, animated: true)
//        
////        var annotation: DDAnnotation = DDAnnotation.alloc()
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
