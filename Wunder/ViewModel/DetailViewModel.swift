
//
//  DetailViewModel.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

class DetailViewModel: NSObject {

    //MARK:- Objects
    private var carDetailModel : CarDetailModel
    
    //MARK:- Initilize
    init(model:CarDetailModel) {
        carDetailModel = model
    }
    
    
    var controllerTitle:String{
        return (carDetailModel.title != "") ? carDetailModel.title : "Unknown"
    }
    
    var imageUrl:String{
      return carDetailModel.vehicleTypeImageUrl
    }
    
    
    var items:[[String:String]]{
        return prepareItemsForTable()
    }
    
    private func prepareItemsForTable() -> [[String:String]]{
        
        var value = [[String:String]]()
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.title.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.title)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.licencePlate.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.licencePlate)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.address.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.address)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.zipCode.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.zipCode)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.city.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.city)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.fuelLevel.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.fuelLevel)"])
        
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.pricingTime.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.pricingTime)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.pricingParking.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.pricingParking)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.isClean.stringValue,
                      ConstantKeys.value.stringValue:"\((carDetailModel.isClean == true) ? "Cleaned" : "Need Wash")"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.isDamaged.stringValue,
                      ConstantKeys.value.stringValue:"\((carDetailModel.isDamaged == true) ? "Car Damaged" : "No Damage")"])

        if carDetailModel.isDamaged {
            value.append([ConstantKeys.key.stringValue:ConstantKeys.damageDescription.stringValue,
                          ConstantKeys.value.stringValue:"\(carDetailModel.damageDescription)"])
        }
        
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.isActivatedByHardware.stringValue,
                      ConstantKeys.value.stringValue:"\((carDetailModel.isActivatedByHardware == true) ? "Activated" : "Not Active")"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.vehicleStateId.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.vehicleStateId)"])
        
        value.append([ConstantKeys.key.stringValue:ConstantKeys.vehicleTypeId.stringValue,
                      ConstantKeys.value.stringValue:"\(carDetailModel.vehicleTypeId)"])
        
        return value
    }
    
}
