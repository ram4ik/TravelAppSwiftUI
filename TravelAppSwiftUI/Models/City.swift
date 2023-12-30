//
//  City.swift
//  TravelAppSwiftUI
//
//  Created by Ramill Ibragimov on 30.12.2023.
//

import Foundation
import CoreLocation

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coord: CLLocationCoordinate2D
}
