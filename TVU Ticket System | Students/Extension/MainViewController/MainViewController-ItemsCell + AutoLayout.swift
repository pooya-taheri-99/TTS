//
//  MainVC-ItemsCell + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension GeneralTableViewCell {
    
    func autoLayoutForMainVCItemsCell() {
        contentView.addSubview(cardView)
        cardView.addSubview(subTitleLabel)
        cardView.addSubview(itemsLabel)
        
        //cardView
        
        cardView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        //itemsLabel
        
        itemsLabel.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: subTitleLabel.topAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        //subTitleLabel
        
        subTitleLabel.anchor(top: itemsLabel.bottomAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: cardView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    
    
    func autoLayoutForManagersCell(){
        contentView.addSubview(cardView)
        cardView.addSubview(managerDetailInfoView)
        
        //cardView
        
        cardView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        managerDetailInfoView.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: cardView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
}//extension
