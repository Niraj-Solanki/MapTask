//
//  DetailImageCell.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit
import Alamofire
class DetailImageCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var itemimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
