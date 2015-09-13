//
//  AILoginManager.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/13/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit
import LocalAuthentication

class AILoginManager: NSObject {

    static func evaluateTouchIDAuthentication(completion : ((success : AnyObject? , authError : NSError?) -> Void)){
        let context = LAContext()
        let authenticationString = "Please authenticate your credentials."
        
        do{
            try context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics)
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationString, reply: { (success, authError) -> Void in
                completion(success: success, authError: authError)
            })
        }
        catch{
            
        }
        
    }
}
