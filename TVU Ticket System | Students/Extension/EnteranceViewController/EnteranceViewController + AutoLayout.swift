//
//  EnteranceViewController + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/15/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension EnteranceViewController {
   
    func autoLayoutForEnteranceVC(){
        view.addSubview(tableViewUserType)
        tableViewUserType.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil
            , padding: UIEdgeInsets(top: 42, left: 16, bottom: 16, right: 16))
    }

}//extension

