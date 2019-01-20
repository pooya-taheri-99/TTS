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
    
    var isMainViewController:Bool = true {
        didSet{
            if isMainViewController {
                
            }else{
                setupCellAppearance()
            }
        }
    }
    
    //MARK: - UI Elements
    
    var managerDetailInfoView = ManagerDetailInfoView()
    var cardView = CardView()
    
    var itemsLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "BTraffic", size: 24)
        label.textColor = .darkGray
        label.text = "متن تست"
        return label
    }()
    
    
    
    var subTitleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "BTraffic", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
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
        self.selectionStyle = .none
        autoLayoutForMainVCItemsCell()
    }
    
    private func setupCellAppearance(){
        autoLayoutForManagersCell()
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
