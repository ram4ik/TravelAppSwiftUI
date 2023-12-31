//
//  Destination.swift
//  TravelAppSwiftUI
//
//  Created by Ramill Ibragimov on 30.12.2023.
//

import Foundation
import CoreLocation

final class Destination: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let latitude: String
    let longitude: String
    let image: String
    let sevenWonder: Bool
    let overlay: Bool
    let details: String
    var expand: Bool
    let city: City
    
    init(from decoder: Decoder) throws {
        
        enum CodingKey: Swift.CodingKey {
            case name
            case latitude
            case longitude
            case image
            case sevenWonder
            case overlay
            case details
            case expand
        }
        
        let values = try decoder.container(keyedBy: CodingKey.self)
        name = try values.decode(String.self, forKey: .name)
        latitude = try values.decode(String.self, forKey: .latitude)
        longitude = try values.decode(String.self, forKey: .longitude)
        image = try values.decode(String.self, forKey: .image)
        sevenWonder = try values.decode(Bool.self, forKey: .sevenWonder)
        overlay = try values.decode(Bool.self, forKey: .overlay)
        details = try values.decode(String.self, forKey: .details)
        expand = try values.decode(Bool.self, forKey: .expand)
        
        city = City(name: name, coord: CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!))
    }
}
