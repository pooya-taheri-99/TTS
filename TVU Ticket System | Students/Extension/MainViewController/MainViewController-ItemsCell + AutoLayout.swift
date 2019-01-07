//
//  MainVC-ItemsCell + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension MainVCItemsCell {
    
    func autoLayoutForMainVCItemsCell() {
        
        //cardView
        contentView.addSubview(cardView)
        cardView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        //itemsLabel
        cardView.addSubview(itemsLabel)
        itemsLabel.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, trailing: cardView.trailingAnchor, bottom: cardView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
}//extension
