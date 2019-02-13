//
//  GeneralActivityIndicator.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 2/6/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class CustomActivityIndicator:UIActivityIndicatorView {

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    init(title:String? = nil) {
        super.init(frame: .zero)
        customizeActivityIndicatorView(title: title)
    }
    
    private func customizeActivityIndicatorView(title:String? = nil){
        let titleLabel = GeneralLabel(fontSize: 12, textAlignment: .center, textColor: .white)
        titleLabel.numberOfLines = 0
        titleLabel.frame = CGRect(x: 0, y: 70, width: 140, height: 21)
        self.style = .white
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = 5.0
        titleLabel.text = title
        self.hidesWhenStopped = true
        self.addSubview(titleLabel)
    }
    
    
}//class
