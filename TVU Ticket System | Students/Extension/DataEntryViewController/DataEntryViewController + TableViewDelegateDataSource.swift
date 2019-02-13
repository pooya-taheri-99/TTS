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
                let provinceList = stringDictionaryCollection[CollectionNames.provinceList]
                return provinceList?.count ?? 0
            case cellIdName.cell2.rawValue:
                let collegeList = stringDictionaryCollection[CollectionNames.collegeList]
                return collegeList?.count ?? 0
            case cellIdName.cell3.rawValue:
                let courseList = stringDictionaryCollection[CollectionNames.courseList]
                return courseList?.count ?? 0
            case cellIdName.cell4.rawValue:
                let gradeList = stringDictionaryCollection[CollectionNames.gradeList]
                return gradeList?.count ?? 0
            case cellIdName.cell7.rawValue:
                let receiverList = stringDictionaryCollection[CollectionNames.receiverList]
                return receiverList?.count ?? 0
            default:
                return 0
            }//switch
            
        }//else
    
    }//func
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! DataEntryVCItemsCell
        let row = indexPath.row
        if userType != nil{
            let ticket = studentTickes[row]
            cell.configureCellForUserType(ticket: ticket as! StudentTicket )
            tableView.separatorStyle = .none
            
        }else{
            switch  selectedCellID {
            case cellIdName.cell1.rawValue:
                cell.textLabel?.text = stringDictionaryCollection[CollectionNames.provinceList]?[row]
            case cellIdName.cell2.rawValue:
                cell.textLabel?.text = stringDictionaryCollection[CollectionNames.collegeList]?[row]
            case cellIdName.cell3.rawValue:
                cell.textLabel?.text = stringDictionaryCollection[CollectionNames.courseList]?[row]
            case cellIdName.cell4.rawValue:
                cell.textLabel?.text = stringDictionaryCollection[CollectionNames.gradeList]?[row]
            case cellIdName.cell7.rawValue:
                cell.textLabel?.text = stringDictionaryCollection[CollectionNames.receiverList]?[row]
                if indexPath.row == 0{
                    cell.textLabel?.font = UIFont(name: "Btraffic", size: 20)
                }
            default:
                return DataEntryVCItemsCell()
            }
            
        }//func
        return cell
    }//func

}//extension


extension DataEntryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if userType != nil{
            let managerDetailViewController = ManagerDetailViewController()
            let ticket = studentTickes as! [StudentTicket]
            let objectId = ticket[row].st_ObejctID
            managerDetailViewController.objectID = objectId
            self.present(managerDetailViewController, animated: true, completion: nil)
        } else {
           
            if selectedCellID == cellIdName.cell1.rawValue{
                if let provinceName = stringDictionaryCollection[CollectionNames.provinceList] {
                    DataEntryViewController.province = provinceName[row]
                    if let province = DataEntryViewController.province {
                        delegate?.provinceSelected(provinceName: province)
                    }
                }
            }else if selectedCellID == cellIdName.cell2.rawValue {
                if let collegeName = stringDictionaryCollection[CollectionNames.collegeList] {
                    let collegeSelected = collegeName[row]
                    delegate?.collegeSelected(collegeName:collegeSelected)
                }
            }else if selectedCellID == cellIdName.cell3.rawValue {
                if let courseList = stringDictionaryCollection[CollectionNames.courseList] {
                    let course = courseList[row]
                    delegate?.courseSelected(courseName: course)
                }
            }else if selectedCellID == cellIdName.cell4.rawValue {
                if let gradeList = stringDictionaryCollection[CollectionNames.gradeList] {
                    let grade = gradeList[row]
                    delegate?.gradeSelected(gradeName: grade)
                }
            }else if selectedCellID == cellIdName.cell7.rawValue {
                if let receiverList = stringDictionaryCollection[CollectionNames.receiverList] {
                    let receiver = receiverList[row]
                    delegate?.receiverSelected(receiverName: receiver)
                }
            }
            self.dismiss(animated: true, completion: nil)
        
        }//else
        tableView.deselectRow(at: indexPath, animated: true)
    }//func
        
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userType != nil {
            return 140.0
        }else{
            return 44.0
        }
    }

    
}//extension
