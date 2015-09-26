//
//  AIIntentValidationClient.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/26/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let intentValues : NSDictionary = [Constants.WITIntents.WITBlockCard : "Are you sure you want to block your card?",Constants.WITIntents.WITChangePIN : "Are you sure you want to change your PIN?"]

class AIIntentValidationClient: NSObject {

    
    
    func generateStringForIntent(intentObj : AIIntentModel) -> String {
        
        if intentObj.intent == Constants.WITIntents.WITTransferMoney {
            return getStringWithEntitiesForTranferMoney(intentObj)
        }
        let intentValueString = intentValues.valueForKey(intentObj.intent!) as! String
        return intentValueString
    }
    
    func getStringWithEntitiesForTranferMoney(intentObj : AIIntentModel) -> String {
        
        if let money = intentObj.entity?.money {
            
            if let person = intentObj.entity?.contact {
                let str = "Are you sure you want to send \(money) to \(person) ?"
                 return str
            }
            else {
                AISpeechClient.readCurrentString(Constants.AIStrings.AIPersonErrorString)
            }
        }
        else {
           AISpeechClient.readCurrentString(Constants.AIStrings.AIMoneyErrorString)
        }
        return ""
    }
}
