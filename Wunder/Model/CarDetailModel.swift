//
//  CarDetailModel.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

class CarDetailModel : CarModel {
    
    var damageDescription:String
    var vehicleTypeImageUrl:String
    var hardwareId:String
    var isActivatedByHardware:Bool
    
    override init(dict:[String:Any]) {
        isActivatedByHardware = getBoolValue(value: dict[ConstantKeys.isActivatedByHardware.rawValue])
        damageDescription = getStringValue(value: dict[ConstantKeys.damageDescription.rawValue])
        vehicleTypeImageUrl = getStringValue(value: dict[ConstantKeys.vehicleTypeImageUrl.rawValue])
        hardwareId = getStringValue(value: dict[ConstantKeys.hardwareId.rawValue])
        
        super.init(dict:dict)
    }
}
