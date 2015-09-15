//
//  AIDashboardViewController.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/15/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let micSize : CGFloat = 50

class AIDashboardViewController: AIBaseViewController, WitDelegate {
    
    var userIntent : AIIntentModel?
    @IBOutlet weak var micButtonView: UIView!
    
    static func createDashboardVCInstance() -> AIDashboardViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardViewController : AIDashboardViewController = storyboard.instantiateViewControllerWithIdentifier("AIDashboardViewController") as! AIDashboardViewController
        return dashboardViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        userIntent = nil
        Wit.sharedInstance().delegate = self
        addWITButton()
    }
    
    func addWITButton() {
        let button : WITMicButton = WITMicButton(frame: CGRectMake(0, 0, micSize, micSize))
        micButtonView.addSubview(button)
    }
    
    // MARK: - Wit Delegate
    
    func witDidGraspIntent(outcomes: [AnyObject]!, messageId: String!, customData: AnyObject!, error e: NSError!) {
        print(outcomes)
        if (e != nil) {
            
        }
        else {
            if outcomes != nil && outcomes.count > 0 {
                if let dataDict : NSDictionary = outcomes.first as? NSDictionary {
                    userIntent = AIIntentModel(dict: dataDict)
                    print(userIntent?.intent)
                    print(userIntent?.entity)
                    print(userIntent?.confidence)

                }
            }
        }
    }
}
