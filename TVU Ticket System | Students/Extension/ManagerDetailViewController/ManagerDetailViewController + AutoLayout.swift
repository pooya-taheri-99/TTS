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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(attachmentImageView)
        contentView.addSubview(detailedInfoView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(confirmButton)
        
        
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        

        contentView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: scrollView.bottomAnchor, height:800, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
       
        
        attachmentImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: nil, height: 250, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8))
        
        detailedInfoView.anchor(top: attachmentImageView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: messageLabel.topAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8))
        
        messageLabel.anchor(top: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: nil, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
        confirmButton.anchor(top: nil, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, height: 50, width: nil, XAxis: contentView.centerXAnchor, YAxis: nil, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    
}//extesion
