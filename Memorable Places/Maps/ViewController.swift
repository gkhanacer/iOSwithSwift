//
//  ViewController.swift
//  Learning Maps
//
//  Created by Rob Percival on 11/07/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBAction func findMe(sender: AnyObject) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet var latitude : UILabel!
    @IBOutlet var longitude : UILabel!
    @IBOutlet var address : UILabel!
    @IBOutlet var altitude : UILabel!
    @IBOutlet var speed : UILabel!
    @IBOutlet var heading : UILabel!
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
            var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
            uilpgr.minimumPressDuration =  1.0
            myMap.addGestureRecognizer(uilpgr)
            
        } else {
        
            let latitude:CLLocationDegrees = (NSString (string: places[activePlace]["lat"]!).doubleValue) as CLLocationDegrees
            let longitude:CLLocationDegrees = (NSString (string: places[activePlace]["long"]!).doubleValue) as CLLocationDegrees
            let latDelta:CLLocationDegrees = 0.01
            let longDelta :CLLocationDegrees = 0.01
            let span:MKCoordinateSpan =  MKCoordinateSpanMake(latDelta, longDelta)
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            myMap.setRegion(region, animated: true)
        
            
            var annotation =  MKPointAnnotation()
            annotation.coordinate =  location
            annotation.title = places[activePlace]["name"]
            myMap.addAnnotation(annotation)
        }
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            
            var touchPoint =  gestureRecognizer.locationInView(self.myMap)
            
            // Spesifik view üzerindeki koordinatı bir harita koortinatına dönüştür.
            var newCoordinate = myMap.convertPoint(touchPoint, toCoordinateFromView: self.myMap)
            
            var loc = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler:{(placemarks, error) in
                
                if ((error) != nil)  { println("Error: \(error)") }
                else {
                    
                    let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                    
                    var subThoroughfare:String
                    var thoroughfare:String
                    
                    
                    
                    if ((p.subThoroughfare) != nil) {
                        subThoroughfare = p.subThoroughfare
                    } else {
                        subThoroughfare = ""
                    }
                    
                    if ((p.thoroughfare) != nil) {
                        thoroughfare = p.thoroughfare
                    } else {
                        thoroughfare = ""
                    }
                    
                    var title = "\(subThoroughfare) \(p.thoroughfare)"
                    
                    if title == " " {
                        title = "Added "
                    }
                    
                    var annotation =  MKPointAnnotation()
                    annotation.coordinate =  newCoordinate
                    annotation.title = title
                    self.myMap.addAnnotation(annotation)
                    
                    places.append(["name":title, "lat":"\(newCoordinate.latitude)", "long":"\(newCoordinate.longitude)"])
                }
                
            })
        }
        
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        
        var userLocation:CLLocation = locations[0] as CLLocation

        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.01
        let longDelta :CLLocationDegrees = 0.01
        let span:MKCoordinateSpan =  MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)

        manager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
            
            if ((error) != nil)  { println("Error: \(error)") }
            else {
                
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                
                var subThoroughfare:String
                
                if ((p.subThoroughfare) != nil) {
                    subThoroughfare = p.subThoroughfare
                } else {
                    subThoroughfare = ""
                }
                
                self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                
            }
            
        })
        
        
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
     
        println("view controller viewWillDisappear")
        
        self.navigationController?.navigationBarHidden = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

