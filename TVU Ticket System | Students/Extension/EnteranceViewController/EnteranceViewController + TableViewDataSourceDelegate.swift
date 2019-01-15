//
//  EnteranceViewController + TableViewDataSourceDelegate.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/15/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension EnteranceViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCell(withIdentifier: reuseCellID, for: indexPath) as? EnteranceVCItemsCell {
            cell.textLabel?.text = userTypes[indexPath.row]
            return cell
        }
        return EnteranceVCItemsCell()
    }
    
}//extesnion



extension EnteranceViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = userTypes[indexPath.row]
        switch selectedItem {
        case "دانشجو":
            let mainVC = MainViewController()
            self.present(mainVC, animated: true, completion: nil)
        case "مدیریت":
            let dataEnteryVC = DataEntryViewController()
            dataEnteryVC.userType = selectedItem
            self.present(dataEnteryVC, animated: true, completion: nil)
        default:
            break
        }
    }
    
}//extension
