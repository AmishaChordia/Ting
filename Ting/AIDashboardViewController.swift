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
   
    // MARK: - Properties
    
    var userIntent : AIIntentModel?
    @IBOutlet weak var micButtonView: UIView!
    @IBOutlet weak var totalBalanceLabel: UILabel!
    
    @IBOutlet weak var navigatnBar: UINavigationBar!
    @IBOutlet weak var lastTransactionLabel: UILabel!
    @IBOutlet weak var amountSpentMonthlyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    // MARK: - ViewSetup
    
    func setUpView() {
        userIntent = nil
        Wit.sharedInstance().delegate = self
        
        navigatnBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont.tingHelveticaRegularWithSize(14)]
        totalBalanceLabel.attributedText = createAmountString("₹ 2,40,000")
        lastTransactionLabel.attributedText = createAmountString("₹ 29,550")
        amountSpentMonthlyLabel.attributedText = createAmountString("₹ 45,000")
        addWITButton()
    }
    
    func addWITButton() {
        let button : WITMicButton = WITMicButton(frame: CGRectMake(0, 0, micSize, micSize))
        micButtonView.addSubview(button)
    }
    
    // MARK: - Utility mathods
    
    static func createDashboardVCInstance() -> AIDashboardViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardViewController : AIDashboardViewController = storyboard.instantiateViewControllerWithIdentifier("AIDashboardViewController") as! AIDashboardViewController
        return dashboardViewController
    }
    
    func createAmountString(moneyString : String) -> NSAttributedString {
        let attributedAmount : NSMutableAttributedString = NSMutableAttributedString(string: moneyString)
        attributedAmount.addAttribute(NSFontAttributeName , value:  UIFont.tingHelveticaMediumWithSize(25.0), range: NSMakeRange(0, 1))
        return attributedAmount
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
