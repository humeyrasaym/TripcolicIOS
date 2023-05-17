//
//  PlaceAnnotation.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 4/1/23.
//

import Foundation
import MapKit

class PlaceAnnotation: MKPointAnnotation {
    
    let mapItem: MKMapItem
    let id = UUID()
    var isSelected: Bool = false
    
    init(mapItem: MKMapItem){
        self.mapItem = mapItem
        super.init()
        self.coordinate = mapItem.placemark.coordinate
    }
    
    var name: String{
        self.mapItem.name ?? ""
    }
    
    var phone: String{
        self.mapItem.phoneNumber ?? ""
    }
    
    var address: String{
        
        "\(mapItem.placemark.subThoroughfare ?? "")\(mapItem.placemark.thoroughfare ?? "")\(mapItem.placemark.locality ?? "")\(mapItem.placemark.countryCode ?? "")"
    }
    
    var location: CLLocation{
        mapItem.placemark.location ?? CLLocation.init()
        
        
    }
    
}
