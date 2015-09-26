//
//  AISuccessView.swift
//  Ting
//
//  Created by Chordia, Amisha (US - Mumbai) on 9/26/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

protocol AISuccessViewDelegate {
    func dismissViewSuccessfully()
}

class AISuccessView: UIView {

    @IBOutlet weak var successMessageLabel: UILabel!
    var delegate : AISuccessViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewPropertiesSetup()
    }
    
    func viewPropertiesSetup() {
        //blur view
        let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blurView = UIVisualEffectView(effect: lightBlur)
        blurView.frame = bounds
        addSubview(blurView)
        sendSubviewToBack(blurView)
        
        layer.borderColor = UIColor.tingDividerBlueColor().CGColor
        layer.borderWidth = 1.5
    }
    
    func setSuccessMessage(sucessString : String) {
        successMessageLabel.text = sucessString
    }


    @IBAction func userTappedOk(sender: UIButton) {        
        delegate?.dismissViewSuccessfully()
    }
    
}
