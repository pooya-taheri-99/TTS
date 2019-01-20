//
//  ManagerDetailInfoView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/20/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class ManagerDetailInfoView:CardView {
    
    
    //MARK: - UI Element
    let managerDetailedInfoGeneralSatckView = ManagerDetailedInfoGeneralStackView()
    
    
    
    //MARK: - Overridden Method
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(managerDetailedInfoGeneralSatckView)
        managerDetailedInfoGeneralSatckView.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8))
    }
    
    //MARK: - Helper Method
    
    
    
    
    
}//class
