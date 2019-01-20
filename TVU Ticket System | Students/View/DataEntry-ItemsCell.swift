//
//  DataEntry-ItemsCell.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/10/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class DataEntryVCItemsCell : UITableViewCell {
    
    var studentNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BTraffic", size: 17)
        label.textAlignment = .center
        return label
    }()
    
    
    var studentIdLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BTraffic", size: 17)
        label.textAlignment = .center
        return label
    }()
    
    
    var stackViewLabels:UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        stackView.axis = .vertical
        return stackView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont(name: "BTraffic", size: 14)
        self.textLabel?.textAlignment = .right
        self.selectionStyle = .blue
    }
    
    func configureCellForDataEntry(stringItem:String){
        textLabel?.text = stringItem
    }
    
    func configureCellForUserType(ticket:StudentTicket){
        autoLayoutForStackView()
        studentNameLabel.text = ticket.st_fullName
        studentIdLabel.text = ticket.st_id
    }
    
    func autoLayoutForStackView(){
        contentView.addSubview(stackViewLabels)
        stackViewLabels.addArrangedSubview(studentNameLabel)
        stackViewLabels.addArrangedSubview(studentIdLabel)
        
        stackViewLabels.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, height: nil, width: nil, XAxis: nil, YAxis: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
}
