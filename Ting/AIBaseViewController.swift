//
//  AIBaseViewController.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/13/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

class AIBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewProperties()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func setUpViewProperties() {
        view.backgroundColor = UIColor.tingBackgroundColor()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
