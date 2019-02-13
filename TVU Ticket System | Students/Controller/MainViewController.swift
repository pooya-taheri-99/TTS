//
//  MainViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/1/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

public enum cellIdName:String {
    case cell1 = "cell1"
    case cell2 = "cell2"
    case cell3 = "cell3"
    case cell4 = "cell4"
    case cell5 = "cell5"
    case cell6 = "cell6"
    case cell7 = "cell7"
    case cell8 = "cell8"
    case none = "none"
}


class MainViewController: UIViewController {
    
    //MARK: - Properteis
    
    var items:[String] = []
    var dataEntryVC:DataEntryViewController!
    let cellReuseID = "ItemsCell"
    let students = Students()
    let backendless = Backendless.sharedInstance()
    private var activityIndicator:UIActivityIndicatorView!
    var imageData:Data?
    
    //MARK: - Computed Properties
    
    var isStudentModelFilledUp:Bool {
        if students.st_province != nil && students.st_college != nil && students.st_course != nil && students.st_fullname != nil && students.st_grade != nil && students.st_ID != nil && students.st_receiverName != nil && students.st_comment != nil {
            return true
        }else{
            return false
        }
    }
    
    
    //MARK: - UI Element
    
    var logoImageView:CustomImageView = {
        let imageView = CustomImageView(frame: .zero)
        imageView.image = UIImage(named: "tvu-logo")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    var sendButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("ارسال", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .disabled)
        btn.titleLabel?.font = UIFont(name: "BTraffic", size: 21)
        btn.isEnabled = false
        return btn
    }()
    
    var tableViewItems:GeneralTableView = {
        let tableView = GeneralTableView()
        return tableView
    }()
    
    var closeButton:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "close_btn"), for: .normal)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewItems.reloadData()
        tableViewItems.layoutIfNeeded()
        if isStudentModelFilledUp {
            sendButton.isEnabled = true
            setupButtonsAction()
        }
    }
    
    //MARK: - Helper Method
    
    
    //primary view setup
    private func setupView() {
        view.backgroundColor = .white
        setupTableView()
        autoLayoutForMainViewController()
        autoLayoutForCloseButton()
        closeButton.addTarget(self, action: #selector(handleCloseButton(_:)), for: .touchUpInside)
    }

    //setup tableView
    private func setupTableView() {
        tableViewItems.delegate = self
        tableViewItems.dataSource = self
        tableViewItems.backgroundColor = .white
        items = MainVCItemsModel.loadItems()
    }
    
    
    //show DataEntryViewController based on which tableview cell is tapped
    func dataEntryVCFunctions(cellID:String) {
        if cellID == cellIdName.cell1.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell2.rawValue {
            if students.st_province == nil{
                DispatchQueue.main.async {
                    TVUAlertView.showAlert(title: "هشدار", message: "ابتدا باید استان مورد نظر را انتخاب کنید", vc: self, btnText: "باشه")
                }
            }else{
                showDataEntryVC(cellID: cellID)
            }
        }else if cellID ==  cellIdName.cell3.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell4.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell5.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell6.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell7.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell8.rawValue {
            showDataEntryVC(cellID: cellID)
        }

    }//func
    
    //show EntryViewController
    private func showDataEntryVC(cellID:String) {
        DispatchQueue.main.async { [unowned self] in
            self.dataEntryVC = DataEntryViewController()
            self.dataEntryVC.selectedCellID = cellID
            self.dataEntryVC.delegate = self
            self.present(self.dataEntryVC, animated: true, completion: nil)
        }
        
    }//func
    
    
    //Save data to backendless database
    private func saveDataToBackendlessDataBase(){
        startActivityIndicator()
        self.uploadImage()
        let dataStore = backendless?.data.of(Students().ofClass())
        dataStore?.save(self.students, response: { [unowned self] (_) in
            DispatchQueue.main.async {[unowned self] in
                self.deleteStudentData(student: self.students)
                self.sendButton.isEnabled = false
                self.tableViewItems.reloadData()
                self.stopActivityIndicator()
                TVUAlertView.showAlert(title: "پیغام", message: "تیکت شما با موفقیت ذخیره شد!", vc: self, btnText: "تایید")
            }
        }, error: { (fault) in
            DispatchQueue.main.async {
                TVUAlertView.showAlert(title:"خطا" , message: "خطا در ذخیره اطلاعات", vc: self, btnText: "تایید")
            }
        })
        
    }//func
    
    
    //upload image to backendless storage
    private func uploadImage(){
        let randomFileName = UUID().uuidString
        students.st_fileName = randomFileName
        backendless?.file.uploadFile("images/" + randomFileName + ".jpg", content: imageData, response: { (_) in
            DispatchQueue.main.async {
                TVUAlertView.showAlert(title: "پیغام", message: "عکس با موفقیت آپلود شد", vc: self, btnText: "تایید")
            }
        }, error: { (fault) in
            DispatchQueue.main.async {
                TVUAlertView.showAlert(title: "خطا", message: "خطا در آپلود فایل", vc: self, btnText: "تایید")
            }
        })
    }//func
    
    //delete all instance propeties of 'Student' object
    private func deleteStudentData(student:Students){
        student.st_college = nil
        student.st_comment = nil
        student.st_ID = nil
        student.st_course = nil
        student.st_fullname = nil
        student.st_grade = nil
        student.st_province = nil
        student.st_receiverName = nil
        imageData = nil
    }
    
    //show activity indicator
    private func startActivityIndicator(){
        activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        activityIndicator.center = view.center
        activityIndicator.layer.cornerRadius = 4.0
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    //hide activity indicator
    private func stopActivityIndicator(){
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }
    }
    
    //setup action for buttons
    private func setupButtonsAction(){
        sendButton.addTarget(self, action: #selector(handleSendButton(_:)), for: .touchUpInside)
    }
    
    //called when sendButton pressed
    @objc private func handleSendButton(_ button:UIButton) {
        saveDataToBackendlessDataBase()
    }
   
    //dismiss view controller
    @objc private func handleCloseButton(_ button:UIButton) {
        dismiss(animated: true, completion: nil)
    }
}//class
