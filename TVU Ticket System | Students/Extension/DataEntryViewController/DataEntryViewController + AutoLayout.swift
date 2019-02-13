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
    
    func autoLayoutForUITableView(){
        view.addSubview(tableViewItems)
        tableViewItems.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor  , height: nil, width: nil
            , XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    func autoLayoutForTextFields(){
        autoLayoutForCardView()
        cardView.addSubview(nameTextField)
        cardView.addSubview(lastNameTextField)
        cardView.addSubview(studentIdTextField)
        
        if selectedCellID == cellIdName.cell5.rawValue {
            nameTextField.anchor(top: titleLabel.bottomAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: lastNameTextField.topAnchor, height: 50, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top:42 , left: 16, bottom: 16, right: 16))
            
            lastNameTextField.anchor(top: nameTextField.bottomAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: nil, height: 50, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top:16 , left: 16, bottom: 0, right: 16))
        }else if selectedCellID == cellIdName.cell6.rawValue{
            studentIdTextField.anchor(top: titleLabel.bottomAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: nil, height: 50, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 16, right: 16))
        }
        
        titleLabel.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: nil, height: 30, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 16))
        
        autoLayoutForConfirmButton()
        
    }
    
    func autoLayoutForTextView(){
        autoLayoutForCardView()
        titleLabel.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: nil, height: 30, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 16))
        cardView.addSubview(ticketTextView)
        cardView.addSubview(selectAttachmentButton)
        ticketTextView.anchor(top: titleLabel.bottomAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: nil, height: 200, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 16))
        selectAttachmentButton.anchor(top: ticketTextView.bottomAnchor, leading: ticketTextView.leadingAnchor, trailing: nil, bottom: nil, height: 50, width: 50, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        
        autoLayoutForConfirmButton()
    }
    
    
    func autoLayoutForConfirmButton() {
        cardView.addSubview(confirmButton)
        confirmButton.anchor(top: nil, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: cardView.bottomAnchor, height: 50, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    func autoLayoutForCardView(){
        titleLabel.removeFromSuperview()
        view.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 32, left: 16, bottom: 16, right: 16))
    }
    
    func autoLayoutForCloseButton(){
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: nil, bottom: nil, height: 25, width: 25, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 16, bottom: 0, right: 0))
    }
    
    
}//extension

