//
//  DetailViewController.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Objects
    var carModel:CarModel!
    var detailViewModel:DetailViewModel?
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }
    
    //MARK:- Actions
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func quickRentAction(_ sender: UIButton) {
        quickRentApi()
    }
    
    //MARK:- CustomMethdo
    func initializeVariables() {
        if carModel != nil {
            titleLabel.text = carModel.title
            getVehicleDetails()
        }
    }
    
    func updateUI() {
        if detailViewModel != nil {
            titleLabel.text = detailViewModel?.controllerTitle
            tableView.reloadData()
        }
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Wunder", message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: { _ in
            //Close Action
        }))
        self.present(alert, animated: true, completion: nil)
    }

    
    //MARK:- API Calls
    func getVehicleDetails() {
        do {
            try Alamofire.request(APIRouter.getVehicleDetails(vehicleId: carModel.carId).asURLRequest())
                .validate()
                .responseJSON(completionHandler: { (response) in
                    guard response.result.isSuccess else {
                        return
                    }
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String:Any]
                        {
                            print(json)
                            let carDetails = CarDetailModel.init(dict: json)
                            self.detailViewModel = DetailViewModel.init(model: carDetails)
                            self.updateUI()
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                })
        } catch  {
            print("APi Route Fail")
        }
    }
    
    
    func quickRentApi() {
        do {
            try Alamofire.request(APIRouter.rentVehicle(vehicleId: carModel.carId).asURLRequest())
                .validate()
                .responseJSON(completionHandler: { (response) in
                    guard response.result.isSuccess else {
                        self.showAlert(message: "Something Went Wrong!")
                        return
                    }
                    self.showAlert(message: "Rent Successfully!")
                    
                })
        } catch  {
            print("APi Route Fail")
        }
    }
}

//MARK:- TableView Delegate & DataSource
extension DetailViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Section 0 for Image
        if section == 0 {
            return 1
        }
        return detailViewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: DetailImageCell.self)) as! DetailImageCell
            cell.itemimageView.setCustomImage(detailViewModel?.imageUrl)
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: DetailItemCell.self)) as! DetailItemCell
            cell.initializeCell(dict: (detailViewModel?.items[indexPath.row])!)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


