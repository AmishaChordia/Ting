//
//  AIValidationViewController.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/21/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit


let leadingSpace : CGFloat = 25

class AIValidationViewController: AIBaseViewController, AISuccessViewDelegate {
    // MARK: - Properties
    
    
    @IBOutlet weak var intentRequestLabel: UILabel!
    var intentModel : AIIntentModel!
    var successView : AISuccessView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewLabelsAndProperties()
    }
    
    func setViewLabelsAndProperties() {
        view.backgroundColor = UIColor.whiteColor()
        let validationClient = AIIntentValidationClient()
        let intentRequestLabelString = validationClient.generateStringForIntent(intentModel)
        
        if intentRequestLabelString.characters.count > 0 {
            intentRequestLabel.text = intentRequestLabelString
        }
        else {
            returnToDashBoardView()
        }
        
    }
    
    //MARK: - AISuccessView
    
    func addOverlay() {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor.tingBrandBlueColor()
        overlay.alpha = 0.95
        
        view.addSubview(overlay)
    }
    
    func addSuccessView() {
        
        addOverlay()
        createSuccessViewInstance()

        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
            self.successView.frame = CGRectMake(leadingSpace, self.view.center.y - (self.successView.frame.height/2), self.view.frame.width - (2 * leadingSpace) , self.successView.frame.height)

            self.view.layoutIfNeeded()
            }) { (success) -> Void in
        }
    }
    
    func createSuccessViewInstance() {
        successView = NSBundle.mainBundle().loadNibNamed("AISuccessView", owner: nil, options: nil).first as! AISuccessView
        successView.delegate = self
        successView.setSuccessMessage(AIIntentValidationClient().generateSuccessMessage(intentModel))
        successView.frame = CGRectMake(leadingSpace, -successView.frame.height, view.frame.width - (2 * leadingSpace) , successView.frame.height)
        self.view.addSubview(self.successView)

    }
    
    func dismissViewSuccessfully() {
        returnToDashBoardView()
    }
    
    // MARK: - Utility methods
    
    static func createValidationVCInstance() -> AIValidationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let validationViewController : AIValidationViewController = storyboard.instantiateViewControllerWithIdentifier("AIValidationViewController") as! AIValidationViewController
        return validationViewController
    }
    
    // MARK: - IBAction methods
    
    @IBAction func userTappedTouchID(sender: UIButton) {
        AILoginManager.evaluateTouchIDAuthentication({ (success, authError) -> Void in
          
            if authError != nil {
                return
            }
            else if let isSuccess = success {
                if isSuccess {
                    dispatch_after(0, dispatch_get_main_queue(), { () -> Void in
                        self.addSuccessView()
                    })
                }
            }
        })
    }
    
    @IBAction func userChangedMind(sender: UIButton) {
        returnToDashBoardView()
    }
    
    func returnToDashBoardView() {
        navigationController?.popViewControllerAnimated(true)
    }
}
