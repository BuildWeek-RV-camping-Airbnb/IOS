//
//  MapViewController.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct Locations {
    var name: String
    var lattitude: CLLocationDegrees
    var longtitude: CLLocationDegrees
}

extension MapViewController: MKMapViewDelegate {
    
}

class MapViewController: UIViewController {

    let location = [Locations]()
    
// MARK:- Outlets
    
    @IBOutlet weak var locationsSearchbarController: UISearchBar!
    @IBOutlet weak var locationsMapView: MKMapView!
    
//    MARK: Actions
    
    @IBAction func zoomIN(_ sender: Any) {
        
        if let userLocation = locationsMapView.userLocation.location?.coordinate {
            
            let region = MKCoordinateRegion( center: userLocation, latitudinalMeters: 2000, longitudinalMeters: 2000)
            
            locationsMapView.setRegion(region, animated: true)
            
        }
    }
    
    
//    MARK: - Properties
    
    let locationManager = CLLocationManager()
    //        List Of Locations
    let thelocation = [Locations(name: "Grand Canyon", lattitude: 36.1127640, longtitude: -113.9960696),
                    Locations(name: "Long Key State Park", lattitude: 24.8161, longtitude: 80.8231),
                    Locations(name: "Rio Grande Big Bend National Park", lattitude: 29.1275, longtitude: 103.2425),
                    Locations(name: "Starved Rock State Park", lattitude: 41.3212, longtitude: 89.0002),
                    Locations(name: "Banff National Park of Canada", lattitude: 51.4968, longtitude: 115.9281),
                    Locations(name: "Estes Park of Colorado", lattitude: 40.3772, longtitude: 105.5217)]
//    MARK: Methods
    
    func fetchLocationsOnMap(_ locations: [Locations]) {
        for locations in location {
            let annotations = MKPointAnnotation()
            annotations.title = locations.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: locations.lattitude, longitude: locations.longtitude)
            locationsMapView.addAnnotation(annotations)
        }
    }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationsMapView.showsUserLocation = true
        case .denied: break // Show alert telling users how to turn on permissions
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationsMapView.showsUserLocation = true
        case .restricted: break // Show alert letting them know whats up
        case .authorizedAlways: break
        }
    }
    
    func locationsMapviewSpecifics(_ locationMapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        locationsMapView.centerCoordinate = userLocation.location!.coordinate
    }
    
//    MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsMapView.delegate = self
        fetchLocationsOnMap(location)
        
        
        
    // Do any additional setup after loading the view.
        if CLLocationManager.locationServicesEnabled() {
            
//             continue to let users know why they need to turn it on 
    
        } else {
//            do something to let users know why they need to turn it on
        }
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
