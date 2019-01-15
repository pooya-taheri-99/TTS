//
//  DataEntryViewController + PickerViewDelegateDataSource.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit




extension DataEntryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if studentTickes.count > 0 {
            return studentTickes.count
        }else{
            switch  selectedCellID {
            case cellIdName.cell1.rawValue:
                return provincesList.count
            case cellIdName.cell2.rawValue:
                return collegeList.count
            case cellIdName.cell3.rawValue:
                return courseList.count
            case cellIdName.cell4.rawValue:
                return gradeList.count
            case cellIdName.cell7.rawValue:
                return receiverList.count
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! DataEntryVCItemsCell
        switch  selectedCellID {
        case cellIdName.cell1.rawValue:
            cell.textLabel?.text = provincesList[indexPath.row]
        case cellIdName.cell2.rawValue:
            cell.textLabel?.text = collegeList[indexPath.row]
        case cellIdName.cell3.rawValue:
            cell.textLabel?.text = courseList[indexPath.row]
        case cellIdName.cell4.rawValue:
            cell.textLabel?.text = gradeList[indexPath.row]
        case cellIdName.cell7.rawValue:
            cell.textLabel?.text = receiverList[indexPath.row]
            if indexPath.row == 0{
                cell.textLabel?.font = UIFont(name: "Btraffic", size: 20)
            }
        default:
            return DataEntryVCItemsCell()
        }
        //DataEntryVCItemsCell()
        
        return cell
    }
    
    
    
}//extension


extension DataEntryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if selectedCellID == cellIdName.cell1.rawValue{
            DataEntryViewController.province = provincesList[row]
            if let province = DataEntryViewController.province {
                delegate?.provinceSelected(provinceName: province)
            }
        }else if selectedCellID == cellIdName.cell2.rawValue {
            let college = collegeList[row]
            delegate?.collegeSelected(collegeName:college)
        }else if selectedCellID == cellIdName.cell3.rawValue {
            let course = courseList[row]
            delegate?.courseSelected(courseName: course)
        }else if selectedCellID == cellIdName.cell4.rawValue {
            let grade = gradeList[row]
            delegate?.gradeSelected(gradeName: grade)
        }else if selectedCellID == cellIdName.cell7.rawValue {
            let receiver = receiverList[row]
            delegate?.receiverSelected(receiverName: receiver)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    
}//extension
