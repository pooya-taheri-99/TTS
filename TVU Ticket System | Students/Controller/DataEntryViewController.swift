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
    var courseList:[String] = []
    var gradeList:[String] = []
    var receiverList:[String] = []
    weak var delegate:DataEntryDelegate?
    static var province:String?
    private var provinceReader:ProvinceReader!
    private var collegListReader:CollegeListReader!
    private var courseListReader:CourseListReader!
    private var gradListReader:GradeListReader!
    private var receiverListReader:ReceiverListReader!
    
    //MARK: - UI Element
    
    var tableViewItems:UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var cardView:CardView = {
        let view = CardView()
        return view
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
    
    var studentIdTextField:CustomUITextField = {
        let textField = CustomUITextField()
        textField.placeholder = "شماره دانشجویی خود را وارد کنید..."
        textField.textAlignment = .right
        textField.textColor = .black
        textField.keyboardType = .decimalPad
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
        view.backgroundColor = UIColor.white
        setupTableView()
        autoLayoutTitleLabel()
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
            autoLayoutForUITableView()
            provinceReader = ProvinceReader()
            provincesList = provinceReader.parseProvinceJSON()
        }else if cellID == cellIdName.cell2.rawValue {
            titleLabel.text = "انتخاب دانشکده..."
            autoLayoutForUITableView()
            collegListReader = CollegeListReader()
            if let prvnc = DataEntryViewController.province {
                collegeList = collegListReader.parseCollegeListJSON(provinceName: prvnc)
            }
        }else if cellID == cellIdName.cell3.rawValue {
            titleLabel.text = "انتخاب رشته تحصیلی"
            autoLayoutForUITableView()
            courseListReader = CourseListReader()
            courseList = courseListReader.readCourseListFromFile()
        }else if cellID == cellIdName.cell4.rawValue {
            titleLabel.text = "انتخاب مقطع تحصیلی"
            autoLayoutForUITableView()
            gradListReader = GradeListReader()
            gradeList = gradListReader.readGradList()
        }else if cellID == cellIdName.cell5.rawValue {
            titleLabel.text = "تعیین نام و نام خانوادگی"
            autoLayoutForTextFields()
        }else if cellID == cellIdName.cell6.rawValue {
            titleLabel.text = "تعیین شماره دانشجویی"
            autoLayoutForTextFields()
        }else if cellID == cellIdName.cell7.rawValue {
            titleLabel.text = "انتخاب گیرنده پیام"
            autoLayoutForUITableView()
            receiverListReader = ReceiverListReader()
            receiverList = receiverListReader.readReceiverList()
        }else if cellID == cellIdName.cell8.rawValue {
            titleLabel.text = "متن پیام"
            autoLayoutForTextView()
        }
        
    }//func
    
    private func setupTableView(){
        tableViewItems.dataSource = self
        tableViewItems.delegate = self
        tableViewItems.register(DataEntryVCItemsCell.self, forCellReuseIdentifier: "itemsCell")
        tableViewItems.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableViewItems.tableFooterView = UIView()
    
    }//func
    
    @objc private func handelConfirmAction(_ btn:UIButton){
        if selectedCellID == cellIdName.cell5.rawValue {
            let name = nameTextField.text
            let lastName = lastNameTextField.text
            
            if name != nil && name != "" && lastName != nil && lastName != ""{
                let fullname = name! + " " + lastName!
                delegate?.getFullName(fullName: fullname)
                self.dismiss(animated: true, completion: nil)
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا مقادیر لازم را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }else if selectedCellID == cellIdName.cell6.rawValue {
            let studentId = studentIdTextField.text
            if studentId != nil && studentId != "" && !(studentId?.isEmpty)!{
                delegate?.getStudentId(id: studentId!)
                self.dismiss(animated: true, completion: nil)
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا مقادیر لازم را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }else if selectedCellID == cellIdName.cell8.rawValue{
            let comment = ticketTextView.text
            if comment != nil && comment != "" && !(comment?.isEmpty)!{
                delegate?.getCommentAndAttachment(comment: comment)
                self.dismiss(animated: true, completion: nil)
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا مقادیر لازم را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }
       
        
    }//func
    
}//class
