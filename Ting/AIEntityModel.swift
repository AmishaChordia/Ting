//
//  AIEntityModel.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/26/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let AIMoney = "amount_of_money"
let AIContact = "contact"
let AIEntityValue = "value"


class AIEntityModel: NSObject {

    var contact : String?
    var money : String?
    
    init(dict: NSDictionary) {
        if let contactPersonValues = dict.valueForKey(AIContact) as? NSArray {
            if contactPersonValues.count > 0 {
                if let person = contactPersonValues.firstObject as? NSDictionary {
                    contact = person.valueForKey(AIEntityValue) as? String
                }
            }
        }
        if let amount = dict.valueForKey(AIMoney) as? NSArray {
            if amount.count > 0 {
                if let amountDict = amount.firstObject as? NSDictionary {
                    
                    var amountUnit : String = "₹"
                    if let unit = amountDict.valueForKey("unit") as? String {
                        amountUnit = unit
                    }
                    if let amountValue = amountDict.valueForKey(AIEntityValue) as? Double {
                        money = amountUnit + " \(amountValue)"
                    }
                }
            }
        }
    }
}
