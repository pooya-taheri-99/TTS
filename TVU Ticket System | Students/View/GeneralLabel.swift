//
//  GeneralLabel.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/20/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class GeneralLabel:UILabel {
    
    
    var hasBorder:Bool = false{
        didSet{
            if hasBorder {
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.borderWidth = 0.5
                
            }else{
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.borderWidth = 0.0
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(fontSize:CGFloat,textAlignment:NSTextAlignment,textColor:UIColor? = .darkGray) {
        super.init(frame: .zero)
        customizeLabel(fontSize: fontSize, textAlignment: textAlignment,textColor: textColor ?? .darkGray)
    }
    
    private func customizeLabel(fontSize:CGFloat,textAlignment:NSTextAlignment,textColor:UIColor? = .darkGray) {
        self.font = UIFont(name: "BTraffic", size:fontSize)
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.minimumScaleFactor = 0.5
        if let txtColor = textColor {
            self.textColor = txtColor
        }
        
    }
    
    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
}//class
