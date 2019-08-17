//
//  HomeViewController.swift
//  Wunder
//
//  Created by Neeraj Solanki on 16/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
class HomeViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- Objects
    var homeViewModel:HomeViewModel?
     var locationManager = CLLocationManager()
     var currentLocation = CLLocation()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }
    
    
    //MARK:- Custom Methods
    func initializeVariables() {
        getVehicleList()
        mapView.delegate = self
        locationManager.delegate = self
    }
    
    func updateMap() {
        guard let annotations = homeViewModel?.annotations else {
            return
        }
        mapView.addAnnotations(annotations)
        mapView.setRegion((homeViewModel?.region)!, animated: true)
    }
    
    //MARK:- Api Calls
    // SerVice Call
    func getVehicleList() {
        do {
            try Alamofire.request(APIRouter.getVehicleList.asURLRequest())
                .validate()
                .responseJSON(completionHandler: { (response) in
                    guard response.result.isSuccess else {
                        return
                    }
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [[String:Any]]
                        {
                            var carsArray = [CarModel]()
                            for item in json
                            {
                                carsArray.append(CarModel.init(dict: item))
                            }
                            // Setup View ViewModel
                            self.homeViewModel = HomeViewModel.init(model: carsArray)
                            self.updateMap()
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                })
        } catch  {
            print("APi Route Fail")
        }
    }
}

//MARK:- Map Delegate
extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        // return if user selected own location
        if (view.annotation?.isEqual(mapView.userLocation))! {
            return
        }
        
        // hide all annotation except selected
        for anotation in mapView.annotations {
            mapView.view(for: anotation)?.isHidden = true
        }
        
        mapView.view(for: mapView.userLocation)?.isHidden = false
        view.isHidden = false
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        // show all annotations
        for anotation in mapView.annotations {
            mapView.view(for: anotation)?.isHidden = false
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // return for userlocation annotation
        if annotation.isEqual(mapView.userLocation) {
            return nil
        }
        
        // Setup for all vehicle annotations
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: (homeViewModel?.annotationViewReuseIdentifier)!)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: (homeViewModel?.annotationViewReuseIdentifier)!)
        }
        
        annotationView = homeViewModel?.getAnnotatinView(annotationView: annotationView!)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // Call Detail View On Selected Map Annotation.
        guard let annotation = view.annotation as? CarAnnotation else { return  }
        
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: String.init(describing: DetailViewController.self)) as! DetailViewController
        detailsViewController.carModel = annotation.carModel
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

//MARK:- Location Handling
extension HomeViewController: CLLocationManagerDelegate
{
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            print("Location Updated")
            homeViewModel?.currentLocation = location
            // Update User Location Set Region
        }
    }
}
