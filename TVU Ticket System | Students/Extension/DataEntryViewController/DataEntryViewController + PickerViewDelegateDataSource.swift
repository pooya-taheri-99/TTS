//
//  DataEntryViewController + PickerViewDelegateDataSource.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit




extension DataEntryViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if selectedCellID == cellIdName.cell1.rawValue{
            return provincesList.count
        }else if selectedCellID == cellIdName.cell2.rawValue {
            return collegeList.count
        }else if selectedCellID == cellIdName.cell3.rawValue {
            
        }else if selectedCellID == cellIdName.cell4.rawValue {
            
        }else if selectedCellID == cellIdName.cell7.rawValue {
            
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedCellID == cellIdName.cell1.rawValue{
            let provinceName = provincesList[row]
            return provinceName
        }else if selectedCellID == cellIdName.cell2.rawValue {
            let collegName = collegeList[row]
            return collegName
        }else if selectedCellID == cellIdName.cell3.rawValue {
            
        }else if selectedCellID == cellIdName.cell4.rawValue {
            
        }else if selectedCellID == cellIdName.cell7.rawValue {
            
        }
        
        return nil
    }
    
}//extension


extension DataEntryViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedCellID == cellIdName.cell1.rawValue{
            if pickerView.selectedRow(inComponent: component) == 0 {
                TVUAlertView.showAlert(title: alertTitle, message: alertMessage, vc: self)
            }
            DataEntryViewController.province = provincesList[row]
        }else if selectedCellID == cellIdName.cell2.rawValue {
            
        }else if selectedCellID == cellIdName.cell3.rawValue {
            
        }else if selectedCellID == cellIdName.cell4.rawValue {
            
        }else if selectedCellID == cellIdName.cell7.rawValue {
            
        }
    }
    
}//extension
