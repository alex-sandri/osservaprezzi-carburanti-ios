//
//  Location.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import CoreLocation
import Foundation

struct Location: Codable, Equatable {
    let lat: Double
    let lng: Double

    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }

    init(_ coordinate: CLLocationCoordinate2D) {
        lat = coordinate.latitude
        lng = coordinate.longitude
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    static var dummy: Location {
        Location(lat: 41.890546, lng: 12.49425)
    }
}
