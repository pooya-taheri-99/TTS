//
//  DataEntry-ItemsCell.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/10/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class DataEntryVCItemsCell : UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont(name: "BTraffic", size: 14)
        self.textLabel?.textAlignment = .right
        self.selectionStyle = .blue
    }
    
}
