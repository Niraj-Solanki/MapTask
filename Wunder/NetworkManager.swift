//
//  NetworkManager.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import Alamofire
enum APIRouter: URLRequestConvertible {
    
    case getVehicleList
    case getVehicleDetails(vehicleId:Int)
    case rentVehicle(vehicleId: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .rentVehicle:
            return .post
        case .getVehicleList, .getVehicleDetails:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getVehicleList:
            return "/cars.json"
        case .getVehicleDetails(let vehicleId):
            return "/cars/\(vehicleId)"
        case .rentVehicle:
            return ""
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .rentVehicle(let vehicleId):
            return [ConstantKeys.carId.rawValue: vehicleId]
        case .getVehicleDetails, .getVehicleList:
            return nil
        }
    }
    
    //MARK:- Base Url
    private var baseUrl: URL {
        switch self {
        case .rentVehicle:
            return URL.init(fileURLWithPath: "https://4i96gtjfia.execute-api.eu-central-1.amazonaws.com/default/wunderfleet-rec ruiting-mobile-dev-quick-rental")
        case .getVehicleDetails, .getVehicleList:
            return URL.init(string: "https://s3.eu-central-1.amazonaws.com/wunderfleet-recruiting-dev")!
        }
    }
    
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        switch self {
        case .rentVehicle:
            urlRequest.setValue("Bearer df7c313b47b7ef87c64c0f5f5cebd6086bbb0fa", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
                    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
                urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        default:
            print("No Authorization Required")
        }
        
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
