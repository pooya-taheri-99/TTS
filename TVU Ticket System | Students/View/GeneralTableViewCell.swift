//
//  ItemsCell.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    let cellReuseID = "ItemsCell"
    var cellID:String = ""
    

    
    //MARK: - UI Elements
    
    var managerDetailInfoView = ManagerDetailInfoView()
    var cardView = CardView()
    var itemsLabel = GeneralLabel(fontSize: 18, textAlignment: .center, textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var subTitleLabel = GeneralLabel(fontSize: 16, textAlignment: .center, textColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    
    //MARK: - Overridden Method
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        textLabel?.font = UIFont(name: "BTraffic", size: 25.0)
        setupView()
    }
    
    override func prepareForReuse() {
       subTitleLabel.text = nil
    }
    
    //MARK: - Helper Method
    
    private func setupView() {
        contentView.backgroundColor = .clear
        self.selectionStyle  = .none
        autoLayoutForMainVCItemsCell()
    }

    func configureCell(itemsString:String,student:Students) {
        self.itemsLabel.text = itemsString
        switch cellID {
        case cellIdName.cell1.rawValue:
            subTitleLabel.text = student.st_province
        case cellIdName.cell2.rawValue:
            subTitleLabel.text = student.st_college
        case cellIdName.cell3.rawValue:
            subTitleLabel.text = student.st_course
        case cellIdName.cell4.rawValue:
            subTitleLabel.text = student.st_grade
        case cellIdName.cell5.rawValue:
            subTitleLabel.text = student.st_fullname
        case cellIdName.cell6.rawValue:
            subTitleLabel.text = student.st_ID
        case cellIdName.cell7.rawValue:
            subTitleLabel.text = student.st_receiverName
        case cellIdName.cell8.rawValue:
            subTitleLabel.text = student.st_comment
        default:
            break
        }
    }
    
    
    
    
}//class
