//
//  AILoginViewController.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/13/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let animationDuration = 0.4
let loginViewTopConstraintDefault = 151
let loginViewTopConstraintWhileEditing = 50


class AILoginViewController: AIBaseViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtnContainer: UIView!
    @IBOutlet weak var touchIdBtnContainer: UIView!
    @IBOutlet weak var loginViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginView()
    }
    
    
    func setUpLoginView() {
        view.backgroundColor = UIColor.blackColor()
        
        loginBtnContainer.layer.borderWidth = 1
        loginBtnContainer.layer.borderColor = UIColor.tingGrayColor(0.3).CGColor
        
        touchIdBtnContainer.layer.borderWidth = 1
        touchIdBtnContainer.layer.borderColor = UIColor.tingGrayColor(0.3).CGColor
    }
}

extension AILoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if loginViewTopConstraint.constant == CGFloat(loginViewTopConstraintDefault) {
            
            UIView.animateWithDuration(animationDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.loginViewTopConstraint.constant = CGFloat(loginViewTopConstraintWhileEditing)
                }) { (finished) -> Void in
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if loginViewTopConstraint.constant != CGFloat(loginViewTopConstraintDefault)  {
            
            UIView.animateWithDuration(animationDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.loginViewTopConstraint.constant = CGFloat(loginViewTopConstraintDefault)
                
                }) { (finished) -> Void in
            }
        }
    }
}