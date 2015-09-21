//
//  Constants.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/13/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import Foundation

class Constants {

    struct touchID {
        static let kUsername : String = "username"
    }

    struct WITIntents {
        static let WITBlockCard : String = "block_card"
        static let WITTransferMoney : String = "transfer_money"
        static let WITBalance : String = "discrete_balance"
    }
    
    struct WITRequisites {
        static let AIToken : String = "NYE5MFRBATXQBEQQP2TQJ3YJSMFEENOO"
        static let AIConfidence = 0.3
    }
    
    struct AIStrings {
        static let AIErrorString : String = "Sorry!  I did not get that. Please try again!"

    }
    
}
