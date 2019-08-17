//
//  HomeViewModel.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import CoreMotion
import MapKit

class HomeViewModel {

    //MARK:- Objects
    private let regionRadius: CLLocationDistance = 1000
    private var carAnnotations : [CarAnnotation]
    private var locationManager = CLLocationManager()
    let annotationViewReuseIdentifier = "annotationViewReuseIdentifier"
    
    var currentLocation = CLLocation()

    //MARK:- Initilize
    init(model:[CarModel]) {
        
        carAnnotations = [CarAnnotation]()
        
        for item in model {
            carAnnotations.append(CarAnnotation.init(object: item))
        }
        checkLocationServices()
       
    }
    
    //MARK:- Custom Methods
   private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()

            locationManager.requestWhenInUseAuthorization()
            if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() ==  .authorizedAlways){
                currentLocation = locationManager.location ?? CLLocation()
            }
            else
            {
                locationManager.requestWhenInUseAuthorization()
            }
        }
        else
        {
            // Alert user
        }
        
        
    }
    
    private func setUpLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
   private func centerMapOnLocation(location: CLLocation) -> MKCoordinateRegion{
    return MKCoordinateRegionMakeWithDistance(location.coordinate,
                                              regionRadius, regionRadius)
    }
    
    public var region:MKCoordinateRegion{
        return centerMapOnLocation(location: currentLocation)
    }
    
    public var annotations:[CarAnnotation]{
        return carAnnotations
    }
    
    func getAnnotatinView(annotationView:MKAnnotationView) -> MKAnnotationView {
        
        annotationView.image = UIImage(named: "car")
        annotationView.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        annotationView.layer.cornerRadius = (annotationView.layer.frame.size.height) / 2
        annotationView.backgroundColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        annotationView.layer.borderWidth = 1.0
        annotationView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // add below line of code to enable selection on annotation view
        let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                size: CGSize(width: 30, height: 30)))
        mapsButton.setBackgroundImage(UIImage(named: "info"), for: UIControlState())
        
        annotationView.rightCalloutAccessoryView = mapsButton
        annotationView.canShowCallout = true
        return annotationView
    }
}
