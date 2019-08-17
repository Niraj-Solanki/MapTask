//
//  Constants.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

// Api Keys
enum ConstantKeys:String {
    case carId
    case title
    case lat
    case lon
    case licencePlate
    case fuelLevel
    case vehicleStateId
    case vehicleTypeId
    case pricingTime
    case pricingParking
    case reservationState
    case isClean
    case isDamaged
    case distance
    case address
    case zipCode
    case city
    case locationId
    case damageDescription
    case vehicleTypeImageUrl
    case hardwareId
    case isActivatedByHardware
    case key
    case value
    
    var stringValue:String {
        switch self {
        case .title:
            return "Title"
        case .lat:
            return "Latitude"
        case .lon:
            return "Longitude"
        case .licencePlate:
            return "Licence Plate"
        case .fuelLevel:
            return "Fuel Level"
        case .vehicleStateId:
            return "Vehicle State"
        case .vehicleTypeId:
            return "Vehicle Type"
        case .pricingTime:
            return "Pricing"
        case .pricingParking:
            return "Parking"
        case .reservationState:
            return "Reservation Status"
        case .isClean:
            return "Clean Status"
        case .isDamaged:
            return "Damage Status"
        case .distance:
            return "Distance"
        case .address:
            return "Address"
        case .zipCode:
            return "Zip Code"
        case .city:
            return "City"
        case .damageDescription:
            return "Damage Description"
        case .isActivatedByHardware:
            return "Hardware Status"
        case .key:
            return "key"
        case .value:
            return "value"
        default:
            return ""
        }
    }
}


//MARK:- Validate Methods
func getIntValue(value:Any?) -> Int {
    
    if let x = value as? Int {
        return x
    }
    return -1
}



func getBoolValue(value:Any?) -> Bool {
    
    if let x = value as? Bool {
        return x
    }
    
    return false
}


func getStringValue(value:Any?) -> String {
    
    if let x = value as? String {
        if x.count == 0
        {
            return "No Information"
        }
        return x
    }
    
    return "No Information"
}

func getDoubleValue(value:Any?) -> Double {
    
    if let x = value as? Double {
        return x
    }
    
    return 0.0
}
