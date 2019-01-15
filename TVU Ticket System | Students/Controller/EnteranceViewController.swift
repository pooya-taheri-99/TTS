//
//  EnteranceViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/15/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class EnteranceViewController:UIViewController {
    
    //MARK: - Properties
    let reuseCellID = "usertypeCell"
    var userTypeReader:UserTypeReader!
    var userTypes:[String] = []
    
    //MARK: - UI Elements
    
    var tableViewUserType:UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var confirmButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("تایید", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "BTraffic", size: 20)
        btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return btn
    }()
    
    
    //MARK: - Overriden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Helper Method
    
   private func setupView() {
        view.backgroundColor = UIColor.white
        autoLayoutForEnteranceVC()
        setupTableView()
        userTypeReader = UserTypeReader()
        userTypes = userTypeReader.readUserType()
    }
    
    private func setupTableView(){
        tableViewUserType.delegate = self
        tableViewUserType.dataSource = self
        tableViewUserType.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableViewUserType.tableFooterView = UIView()
        tableViewUserType.isScrollEnabled = false
        tableViewUserType.register(EnteranceVCItemsCell.self, forCellReuseIdentifier: reuseCellID)
    }

    
    
    
}//class
