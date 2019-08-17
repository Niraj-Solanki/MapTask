//
//  CarModel.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

class CarModel {

    var carId:Int
    var title:String
    var latitude:Double
    var longitude:Double
    var licencePlate:String
    var fuelLevel:Int
    var vehicleStateId:Int
    var vehicleTypeId:Int
    var pricingTime:String
    var pricingParking:String
    var reservationState:Int
    var isClean:Bool
    var isDamaged:Bool
    var distance:String
    var address:String
    var zipCode:String
    var city:String
    var locationId:Int
    
    init(dict:[String:Any]) {
        carId = getIntValue(value: dict[ConstantKeys.carId.rawValue])
        title = getStringValue(value: dict[ConstantKeys.title.rawValue])
        latitude = getDoubleValue(value: dict[ConstantKeys.lat.rawValue])
        longitude = getDoubleValue(value: dict[ConstantKeys.lon.rawValue])
        licencePlate = getStringValue(value: dict[ConstantKeys.licencePlate.rawValue])
        fuelLevel = getIntValue(value: dict[ConstantKeys.fuelLevel.rawValue])
        vehicleStateId = getIntValue(value: dict[ConstantKeys.vehicleStateId.rawValue])
        vehicleTypeId = getIntValue(value: dict[ConstantKeys.vehicleTypeId.rawValue])
        pricingTime = getStringValue(value: dict[ConstantKeys.pricingTime.rawValue])
        pricingParking = getStringValue(value: dict[ConstantKeys.pricingParking.rawValue])
        reservationState = getIntValue(value: dict[ConstantKeys.reservationState.rawValue])
        isClean = getBoolValue(value: dict[ConstantKeys.isClean.rawValue])
        isDamaged = getBoolValue(value: dict[ConstantKeys.isDamaged.rawValue])
        distance = getStringValue(value: dict[ConstantKeys.distance.rawValue])
        address = getStringValue(value: dict[ConstantKeys.address.rawValue])
        zipCode = getStringValue(value: dict[ConstantKeys.zipCode.rawValue])
        city = getStringValue(value: dict[ConstantKeys.city.rawValue])
        locationId = getIntValue(value: dict[ConstantKeys.locationId.rawValue])
        
    }
    
}








