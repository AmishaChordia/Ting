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
let loginViewTopConstraintWhileEditing = 40


class AILoginViewController: AIBaseViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtnContainer: UIView!
    @IBOutlet weak var touchIdBtnContainer: UIView!
    @IBOutlet weak var loginViewTopConstraint: NSLayoutConstraint!
    let userKeychainWrapper = KeychainWrapper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLoginView()
        if  let savedUsername = NSUserDefaults.standardUserDefaults().valueForKey(Constants.touchID.kUsername) {
            invokeTouchIDWithUsername(savedUsername as! String)
        }
    }
    
    func setUpLoginView() {
        view.backgroundColor = UIColor.blackColor()
        
        loginBtnContainer.layer.borderWidth = 1
        loginBtnContainer.layer.borderColor = UIColor.tingGrayColor(0.3).CGColor
        
        touchIdBtnContainer.layer.borderWidth = 1
        touchIdBtnContainer.layer.borderColor = UIColor.tingGrayColor(0.3).CGColor
    }
    
    func validateLoginFields() -> Bool {
        view.endEditing(true)
        if username.text?.characters.count > 0 && username.text?.characters.count > 0 {
            return true
        }
        return false
    }
    
    func pushToDashboard() {
        
    }
    
    //MARK: IBAction 
    
    @IBAction func loginTapped(sender: UIButton) {
        if validateLoginFields() {
            pushToDashboard()
        }
    }
    
    @IBAction func loginWithTouchIdTapped(sender: UIButton) {
        if  let savedUsername = NSUserDefaults.standardUserDefaults().valueForKey(Constants.touchID.kUsername) {
            invokeTouchIDWithUsername(savedUsername as! String)
        }
        else {
            if validateLoginFields() {
                saveUserCredentials()
            }
        }
    }
    
    //MARK: TouchID Implementation
    
    func saveUserCredentials() {
        NSUserDefaults.standardUserDefaults().setValue(username.text, forKey: Constants.touchID.kUsername)
        userKeychainWrapper.mySetObject(password.text, forKey: kSecValueData)
        userKeychainWrapper.writeToKeychain()
    }
    
    func invokeTouchIDWithUsername(savedUsername : String) {
        view.endEditing(true)
        AILoginManager.evaluateTouchIDAuthentication({ (success, authError) -> Void in
            
            if authError != nil {
                return
            }
            else if (success != nil) {
                self.username.text = savedUsername as String
                self.password.text = self.userKeychainWrapper.myObjectForKey("v_Data") as? String
                self.pushToDashboard()
            }
            
        })
        
    }
}

    //MARK: UITextFieldDelegate

extension AILoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if loginViewTopConstraint.constant == CGFloat(loginViewTopConstraintDefault) {
            self.loginViewTopConstraint.constant = CGFloat(loginViewTopConstraintWhileEditing)
            UIView.animateWithDuration(animationDuration, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.view.layoutIfNeeded()
                }) { (finished) -> Void in
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if loginViewTopConstraint.constant != CGFloat(loginViewTopConstraintDefault)  {
            self.loginViewTopConstraint.constant = CGFloat(loginViewTopConstraintDefault)
            UIView.animateWithDuration(animationDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.view.layoutIfNeeded()
                }) { (finished) -> Void in
            }
        }
    }
}