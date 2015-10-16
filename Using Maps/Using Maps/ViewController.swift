//
//  ViewController.swift
//  Using Maps
//
//  Created by Gökhan ACER on 12/24/14.
//  Copyright (c) 2014 Gökhan ACER. All rights reserved.
//

import UIKit
import MapKit // for use map
import CoreLocation // for use location

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    // Tüm lokasyon bilgilerini almak için kullanılır.
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Core Location
        
        // Normalde tableview veya mapview'in kulağından tutup view controller'a ekliyoruz.
        // Ancak Location Manager storyboard'da olan bir nesne değil.
        // Bu neden aşağıdaki şekilde view controller'a bağlıyoruz.
        manager.delegate = self
        
        // Bir çok desired accuracy ( istenen doğruluk) seviyesi  vardır.
        manager.desiredAccuracy = kCLLocationAccuracyBest // Genelde GPS kullanır. wifi, gprs
        
        // requestWhenInUseAuthorization sadece kullanacağımız zaman gerekli. eğer uygulamamız arkaplanda çalışmayacaksa bu kullanılır.
        // requestAlwaysAuthorization ise her zaman kullanılır. eğer uygulamamız arkaplanda çalışacaksa(sürekli), bu tercih edilir.
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
        
        
        
        
        
        
        // using map
        
        // 39.907402, 32.743655 noktaları için :

        // enlem
        var latitude:CLLocationDegrees = 39.907402;
        
        // boylam
        var longtitude:CLLocationDegrees = 32.743655
        
        // zoom seviyesi - level of zoom -- azaldıkça yakınlaşır. doğal sayı alır. 0 ile tam zoom yapar.
        var latDegree:CLLocationDegrees = 0.01

        var longDegree:CLLocationDegrees = 0.01
        
        // Kapsam, yayılma, aralık
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDegree, longDegree)
        
        // lokasyon
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        // alan
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)
        
        
        
        // annotation tanımlama
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "TAEK"
        
        annotation.subtitle = "Türkiye Atom Enerjisi Kurumu"
        
        
        // adding annotations to map
        // annotaiton'ı map'e ekleme
        myMap.addAnnotation(annotation)
        
        
        // eğer "action:" ise parametre de gönderilecek, "action" olursa fonkstion parametre anlmayacak anlamına gelir.
        // burada sadece tanımlama yapılıyor.
        // bu gesture recognizer daha sonra haritamıza eklenecektir.
        var uilpr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        // long press'in minimumunu belirliyoruz.
        uilpr.minimumPressDuration =  2.0
        
        // gestrure recognizer map'e eklenmelidir.
        myMap.addGestureRecognizer(uilpr)
        
    }
    
    // Bu fonksiyon lokasyon her güncellendiğinde otomatik olarak çağrılır.
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        //println("location : \(locations)")
        
        var userLocation = locations[0] as CLLocation
        
        //println(userLocation.coordinate.latitude)
        
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        var longtitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        var latDegree:CLLocationDegrees = 0.01
        
        var longDegree:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDegree, longDegree)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)

    }
    
    // Bu fonksiyon lokasyon  güncellendiğinde bir hata     olduğunda  çağrılır.
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    
    func action(gestureRecognizer:UILongPressGestureRecognizer) {
        
        println("test")
        
        // dokunulan yerin koordinatı CGPoint formatında elde edilir.
        var toucPoint = gestureRecognizer.locationInView(self.myMap)
        
        var newCoordinate:CLLocationCoordinate2D = myMap.convertPoint(toucPoint, toCoordinateFromView: self.myMap)
        
        var newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoordinate
        
        newAnnotation.title = "New Point"
        
        newAnnotation.subtitle = "Türkiye Atom Enerjisi Kurumu"

        self.myMap.addAnnotation(newAnnotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

