//
//  CardView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class CardView : UIView {
    
    private let customGrayShadowColor:CGColor = UIColor.gray.withAlphaComponent(0.5).cgColor
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardViewEffect()
    }
    
    private func setupCardViewEffect() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.5
        self.layer.shadowColor = customGrayShadowColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
    }
    
}//class
