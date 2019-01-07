//
//  DataEntryViewController + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

extension DataEntryViewController {
   
    func autoLayoutTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, height: 30, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 16))
    }
    
    func autoLayoutForDataPickerView(){
        view.addSubview(dataPickerView)
        dataPickerView.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: confirmButton.topAnchor , height: nil, width: nil
            , XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func autoLayoutForTextFields(){
        
    }
    
    func autoLayoutForTextView(){
        
    }
    
    func autoLayoutForAttachmentButton(){
        
    }
    
    func autoLayoutForConfirmButton() {
        view.addSubview(confirmButton)
        confirmButton.anchor(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: 45, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }
    
}//extension

