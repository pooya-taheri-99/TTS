//
//  CustomTextField.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/1/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

@IBDesignable
class CustomUITextField : UITextField {
    
    let customEdgeInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    let customLightGrayColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = customLightGrayColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        self.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: customEdgeInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: customEdgeInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: customEdgeInset)
    }
 
    
}//class
