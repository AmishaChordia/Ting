//
//  AIMicInteractionView.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/16/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit


protocol AIIntentDelegate {
    func WITUserIntentSelected(intent : AIIntentModel)
}

class AIMicInteractionView: UIView , WitDelegate {

    @IBOutlet weak var micTextLabel: UILabel!
    @IBOutlet weak var micView: UIView!
    
    var delegate : AIIntentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViewProperties()
    }
    
    func addWITMicButton() {
        let button : WITMicButton = WITMicButton(frame: CGRectMake(0, 0, micSize, micSize))
        micView.addSubview(button)
    }
    
    func setUpViewProperties() {
        Wit.sharedInstance().delegate = self
        addWITMicButton()
    }
    
    func witDidGraspIntent(outcomes: [AnyObject]!, messageId: String!, customData: AnyObject!, error e: NSError!) {
        print(outcomes)
        if (e != nil) {
            
        }
        else {
            if outcomes != nil && outcomes.count > 0 {
                if let dataDict : NSDictionary = outcomes.first as? NSDictionary {
                    
                    let userIntent : AIIntentModel = AIIntentModel(dict: dataDict)
                    print(userIntent.intent)
                    print(userIntent.entity)
                    print(userIntent.confidence)
                    delegate?.WITUserIntentSelected(userIntent)
                }
                else {
                    AISpeechClient.readCurrentString(Constants.AIStrings.AIErrorString)
                }
            }
            else {
                AISpeechClient.readCurrentString(Constants.AIStrings.AIErrorString)
            }
        }
    }
    
}
