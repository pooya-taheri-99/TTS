//
//  DataEntryViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class DataEntryViewController: UIViewController {

    //MARK: - Properteis
    
    var selectedCellID:String?
    var provincesList:[String] = []
    var collegeList:[String] = []
    let alertMessage = "لطفا یکی از استان های زیر را  انتخاب کنید"
    let alertTitle = "هشدار!!!"
    static var province:String?
    private var provinceReader:ProvinceReader!
    private var collegListReader:CollegeListReader!
    
    //MARK: - UI Element
    
    var dataPickerView:UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .lightGray
        pickerView.layer.cornerRadius = 6.0
        return pickerView
    }()
    
    var nameTextField:CustomUITextField = {
        let textField = CustomUITextField()
        textField.placeholder = "نام خود را وارد کنید..."
        textField.textAlignment = .right
        textField.textColor = .black
        textField.font = UIFont(name: "BTraffic", size: 17)
        return textField
    }()
    
    var lastNameTextField:CustomUITextField = {
        let textField = CustomUITextField()
        textField.placeholder = "نام خانوادگی خود را وارد کنید..."
        textField.textAlignment = .right
        textField.textColor = .black
        textField.font = UIFont(name: "BTraffic", size: 17)
        return textField
    }()
    
    var ticketTextView:CustomTextView = {
        let textView = CustomTextView()
        
        return textView
    }()
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "BTraffic", size: 30)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    var confirmButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("تایید", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        btn.titleLabel?.font = UIFont(name: "BTraffic", size: 23)
        btn.layer.cornerRadius = 4.0
        return btn
    }()
    
    //MARK: - Overridden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //MARK: - Helper Method
    private func setupView() {
        view.backgroundColor = .white
        setupPickerView()
        autoLayoutTitleLabel()
        autoLayoutForConfirmButton()
        if let cellID = selectedCellID {
            setupViewBasedOnCellId(cellID: cellID)
        }
        setupActionForButton()
        
    }
    
    private func setupActionForButton() {
        confirmButton.addTarget(self, action: #selector(handelConfirmAction(_:)), for: .touchUpInside)
    }
    
    private func setupViewBasedOnCellId(cellID:String){
        if cellID == cellIdName.cell1.rawValue {
            titleLabel.text = "انتخاب استان"
            autoLayoutForDataPickerView()
            provinceReader = ProvinceReader()
            provincesList = provinceReader.parseProvinceJSON()
            provincesList.insert("همه استان ها", at: 0)
        }else if cellID == cellIdName.cell2.rawValue {
            titleLabel.text = "انتخاب دانشکده"
            autoLayoutForDataPickerView()
            collegListReader = CollegeListReader()
            if let prvnc = DataEntryViewController.province {
                collegeList = collegListReader.parseCollegeListJSON(provinceName: prvnc)
            }
        }else if cellID == cellIdName.cell3.rawValue {
            
        }else if cellID == cellIdName.cell4.rawValue {
            
        }else if cellID == cellIdName.cell5.rawValue {
            
        }else if cellID == cellIdName.cell6.rawValue {
            
        }else if cellID == cellIdName.cell7.rawValue {
            
        }else if cellID == cellIdName.cell8.rawValue {
            
        }
    }
    
    private func setupPickerView(){
        dataPickerView.dataSource = self
        dataPickerView.delegate = self
    }
    
    @objc private func handelConfirmAction(_ btn:UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}//class
