//
//  MapViewController.swift
//  TestFireBase
//
//  Created by Apple on 12/17/20.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubTitle: String, location: CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var topView: UIView!
    
    var viewPin = ""
    
    var temp = 0.0
    var humidity = 0.0
    var qualityAir = 0.0
    var data: [Any] = []
    var data2: [Any] = []
    var data3: [Any] = []
    var nameLocation = "Royal City"
    var addressLocation = "Thanh Xuân, Hà Nội, Việt Nam"
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        
        qualityAir = data[0] as! Double
        self.mapView.delegate = self
        
        let location = CLLocationCoordinate2D(latitude: data[3] as! CLLocationDegrees, longitude: data[4] as! CLLocationDegrees)
        let location2 = CLLocationCoordinate2D(latitude: data2[3] as! CLLocationDegrees, longitude: data2[4] as! CLLocationDegrees)
        let location3 = CLLocationCoordinate2D(latitude: data3[3] as! CLLocationDegrees, longitude: data3[4] as! CLLocationDegrees)
        
        let anno1 = MKPointAnnotation()
        anno1.coordinate = CLLocationCoordinate2D(latitude: data2[3] as! CLLocationDegrees, longitude: data2[4] as! CLLocationDegrees)
        mapView.addAnnotation(anno1)
        let anno2 = MKPointAnnotation()
        anno2.coordinate = CLLocationCoordinate2D(latitude: data3[3] as! CLLocationDegrees, longitude: data3[4] as! CLLocationDegrees)
        mapView.addAnnotation(anno2)
        
        
        let pin = customPin(pinTitle: "\(data[5])", pinSubTitle: "\(data[6])", location: location)
        let pin2 = customPin(pinTitle: "\(data2[5])", pinSubTitle: "\(data2[6])", location: location2)
        let pin3 = customPin(pinTitle: "\(data3[5])", pinSubTitle: "\(data3[6])", location: location3)
        self.mapView.addAnnotation(pin)
        self.mapView.addAnnotation(pin2)
        self.mapView.addAnnotation(pin3)
        
        topView.layer.borderWidth = 2
        topView.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            centerLocation()
            locationManager.startUpdatingLocation()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    func centerLocation() {
        if let userLocation = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customPin")
        annotationView.image = UIImage(named: "tick")
        annotationView.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        
    }
    
    
//    func setPinColor() {
//        if qualityAir <= 12 {
//            viewPin = "green"
//        }
//        else if qualityAir <= 35.4 {
//            viewPin = "yellow"
//        }
//        else if qualityAir <= 55.4 {
//            viewPin = "orange"
//        }
//        else if qualityAir <= 150.4 {
//            viewPin = "red"
//        }
//        else if qualityAir <= 250.4 {
//            viewPin = "purple"
//        }
//        else if qualityAir >= 250.4 {
//            viewPin = "brown"
//        }
//    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 0.03, longitudinalMeters: 0.03)
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
