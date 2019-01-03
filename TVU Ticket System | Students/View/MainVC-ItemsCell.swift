//
//  ItemsCell.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class MainVCItemsCell: UITableViewCell {
    
    //MARK: - Properties
    
    let cellReuseID = "ItemsCell"
    var cellID:String = ""
    
    //MARK: - UI Elements
    
    var cardView:CardView = {
        let cView = CardView()
        return cView
    }()
    
    var itemsLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "BTraffic", size: 24)
        label.textColor = .darkGray
        label.text = "متن تست"
        return label
    }()
    
    //MARK: - Overridden Method
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: cellReuseID)
        setupView()
    }
    
    //MARK: - Helper Method
    
    private func setupView() {
        contentView.backgroundColor = .clear
        self.selectionStyle = .none
        autoLayoutForMainVCItemsCell()
    }
    
    func configureCell(itemsString:String) {
        self.itemsLabel.text = itemsString
    }
    
}//class
