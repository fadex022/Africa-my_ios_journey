//
//  LocationModel.swift
//  Africa
//
//  Created by Gauss on 30/04/2022.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed propertiy
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
