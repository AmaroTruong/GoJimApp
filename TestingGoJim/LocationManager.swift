//
//  LocationManager.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/25/23.
//

import MapKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var region = MKCoordinateRegion()
    let manager = CLLocationManager() // Change access level to internal
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: lastLocation.coordinate.latitude,
                longitude: lastLocation.coordinate.longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.5,
                longitudeDelta: 0.5
            )
        )
    }
}

