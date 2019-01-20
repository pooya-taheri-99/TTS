//
//  ManagerDetailViewController + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/20/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension ManagerDetailViewController {
    
    func autoLayoutForManagerDetailVC(){
        view.addSubview(attachmentImageView)
        view.addSubview(detailedInfoView)
        view.addSubview(messageLabel)
        
        attachmentImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, height: 250, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 16))
        
        detailedInfoView.anchor(top: attachmentImageView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: messageLabel.topAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
        messageLabel.anchor(top: detailedInfoView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    
}//extesion
