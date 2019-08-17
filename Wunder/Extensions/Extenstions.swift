//
//  Extenstions.swift
//  Wunder
//
//  Created by Neeraj Solanki on 17/08/19.
//  Copyright © 2019 Mr.Solanki. All rights reserved.
//

import UIKit

extension UIImageView
{
    
    // Custom Method for Image Download And Apply
    func setCustomImage(_ imgURLString: String?) {
        
        guard let url:URL = URL(string: imgURLString ?? "") else
        {
            self.image = UIImage.init(named: "default")
            return
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf:url )
            DispatchQueue.main.async {
                self.image = data != nil ? UIImage(data: data!) : UIImage(named: "default")
            }
        }
    }
}
