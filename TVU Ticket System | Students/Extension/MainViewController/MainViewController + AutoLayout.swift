//
//  MainViewController + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func autoLayoutForMainViewController() {
        //logoImageView
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, leading: nil, trailing: nil, bottom: nil, height: 120, width: 120, XAxis: view.centerXAnchor, YAxis: nil, padding: UIEdgeInsets(top: 42, left: 0, bottom: 0, right: 0))
        
        //tableView
        view.addSubview(tableViewItems)
        tableViewItems.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        
    }//func
    
}//extension
