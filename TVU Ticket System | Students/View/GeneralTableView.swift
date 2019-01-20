//
//  CustomTableView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class GeneralTableView: UITableView {
    
    //MARK: - Properties

    let cellReuseID = "ItemsCell"
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Overridden Method
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    private func setupTableView(){
        self.separatorStyle = .none
        self.register(GeneralTableViewCell.self ,forCellReuseIdentifier: cellReuseID)
    }
    
}//class

