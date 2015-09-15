//
//  AIColor.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/13/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

extension UIColor {
    
    class func tingBrandBlueColor() -> UIColor {
        return UIColor(red: 33/255.0, green: 118/255.0, blue: 155/255.0, alpha: 1)
    }
    
    
    
    class func tingGrayColor(opacity : CGFloat) -> UIColor {
        return UIColor(red: 49/255.0, green: 51/255.0, blue: 62/255.0, alpha: opacity)
    }
}