//
//  GeneralUIButton.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/23/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class GeneralUIButton:UIButton {
    
    
    var hasCornerRadius:Bool = false {
        didSet{
            if hasCornerRadius {
                self.layer.cornerRadius = 4.0
            }else{
                self.layer.cornerRadius = 0.0
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title:String,state:UIControl.State,backgroundColor:UIColor? = .white) {
        super.init(frame: .zero)
        customSetting()
        self.setTitle(title, for: state)
        if let bgColor = backgroundColor {
            self.backgroundColor = bgColor
        }
    }
    
    init(image:UIImage,tintColor:UIColor? = nil) {
        super.init(frame: .zero)
        customSetting()
        self.setImage(image, for: .normal)
        if let tColor = tintColor {
            self.tintColor = tColor
        }
    }
    
    private func customSetting(){
        self.titleLabel?.font = UIFont(name: Constants.BTrafficFont, size: Constants.normalFontSize)
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    }
    
}//class
