//
//  CarAnnotation.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import MapKit

class CarAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    var coordinate: CLLocationCoordinate2D
    let carModel:CarModel
    
    init(object:CarModel) {
        
        self.title = object.title
        self.locationName = object.licencePlate
        self.discipline = object.city
        self.coordinate = CLLocationCoordinate2D.init(latitude: object.latitude, longitude: object.longitude)
        self.carModel = object
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
