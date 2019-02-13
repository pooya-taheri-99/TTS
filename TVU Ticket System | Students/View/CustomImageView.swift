//
//  CustomImageView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class CustomImageView : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4.0
        self.clipsToBounds = true
    }
    
    init(aspectRatio:UIView.ContentMode,backgroundColor:UIColor? = .clear,image:UIImage? = nil) {
        super.init(frame: .zero)
        self.contentMode = aspectRatio
        if let bgColor = backgroundColor {
            self.backgroundColor = bgColor
        }
        self.image = image
    }
    
}//class
