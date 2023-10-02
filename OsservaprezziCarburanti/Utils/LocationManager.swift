//
//  LocationManager.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 29/09/23.
//

import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private var manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    var location: Location?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            location = Location(coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status

        if status == .authorizedWhenInUse {
            manager.requestLocation()
        } else if status == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)

        if isPreview {
            location = Location.dummy
        }
    }

    func requestLocation() {
        manager.requestLocation()
    }
}
