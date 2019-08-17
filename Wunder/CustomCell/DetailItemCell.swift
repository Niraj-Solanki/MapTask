//
//  DetailItemCell.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

class DetailItemCell: UITableViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK:- Custom Methods
    func initializeCell(dict:[String:String]) {
        itemTitleLabel.text = dict[ConstantKeys.key.stringValue]
        itemValueLabel.text = dict[ConstantKeys.value.stringValue]
    }

}
