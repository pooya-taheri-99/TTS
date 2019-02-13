//
//  DataEntryViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

//************************************************************************************************************************
//*
//AutoLayout stuff are in : Extesnion -> DataEntryViewController -> DataEntryViewController + AutoLayout.swift
//*
//TableView Delegate and DataSource are in :  Extesnion -> DataEntryViewController -> DataEntryViewController + TableViewDelegateDataSource.swift
//*
//ImagePickerControllerDelegate and UINavigationControllerDelegate are in : Extesnion -> DataEntryViewController -> DataEntryViewController + ImagePickerControllerDelegate.swift
//*
//************************************************************************************************************************


import UIKit


class DataEntryViewController: UIViewController {

    //CollectionNames for "stringDictionaryCollection" naming
    struct CollectionNames {
        static let provinceList = "provinceList"
        static let collegeList = "collegeList"
        static let courseList = "courseList"
        static let gradeList = "gradeList"
        static let receiverList = "receiverList"
    }
    
    
    //MARK: - Properteis
    
    var selectedCellID:String?
    var userType:String?
    var studentTickes:[Any] = []
    var stringDictionaryCollection:[String:[String]] = [CollectionNames.provinceList:[],
                                                        CollectionNames.collegeList:[],
                                                        CollectionNames.courseList:[],
                                                        CollectionNames.gradeList:[],
                                                        CollectionNames.receiverList:[]]
    weak var delegate:DataEntryDelegate?
    static var province:String?
    var imageData:Data?
    private var provinceReader:ProvinceReader!
    private var collegListReader:CollegeListReader!
    private var courseListReader:CourseListReader!
    private var gradListReader:GradeListReader!
    private var receiverListReader:ReceiverListReader!
    private let dataStore = Backendless.sharedInstance()?.data.of(Students.ofClass())
    private var imagePicker:UIImagePickerController!
    
    //MARK: - UI Element
    
    var tableViewItems = UITableView()
    
    var cardView = CardView()
    
    
    
    var ticketTextView = CustomTextView()
    
    var titleLabel = GeneralLabel(fontSize: Constants.bigFontSize, textAlignment: .center, textColor: .darkGray)
    
    var closeButton = GeneralUIButton(image: #imageLiteral(resourceName: "close_btn"))
    
    var confirmButton:GeneralUIButton = {
        let btn = GeneralUIButton(title: "تایید", state: .normal, backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        btn.hasCornerRadius = true
        return btn
    }()
    
    var selectAttachmentButton:GeneralUIButton = {
        let btn = GeneralUIButton(image: #imageLiteral(resourceName: "add-media"), tintColor: #colorLiteral(red: 0.1146069989, green: 0.3011208177, blue: 0.9670061469, alpha: 1))
        btn.imageEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        return btn
    }()
    
    var nameTextField:CustomUITextField = {
        let textField = CustomUITextField(textAlignmnet: .right, placeHolder: "نام خود را وارد کنید...")
        return textField
    }()
    
    var lastNameTextField:CustomUITextField = {
        let textField = CustomUITextField(textAlignmnet: .right, placeHolder: "نام خانوادگی خود را وارد کنید...")
        return textField
    }()
    
    var studentIdTextField:CustomUITextField = {
        let textField =  CustomUITextField(textAlignmnet: .right, placeHolder: "شماره دانشجویی خود را وارد نمایید...", keyboardType: .decimalPad)
        return textField
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
    
    //primary view setup
    private func setupView() {
        view.backgroundColor = UIColor.white
        setupTableView()
        autoLayoutTitleLabel()
        autoLayoutForCloseButton()
        
        if userType != nil{
            titleLabel.text = "لیست تیکت ها"
            autoLayoutForUITableView()
            restoreAllTikcets()
        } else {
            if let cellID = selectedCellID {
                setupViewBasedOnCellId(cellID: cellID)
            }
        }
        setupActionForButton()
    }//func
    
    //setup actions for buttons in the DataEntryViewController
    private func setupActionForButton() {
        confirmButton.addTarget(self, action: #selector(handelConfirmAction(_:)), for: .touchUpInside)
        selectAttachmentButton.addTarget(self, action: #selector(handleAttachmentButton(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(handleCloseButton(_:)), for: .touchUpInside)
    }
    
    
    //setup primary view based on which tableview cell is selected from MainViewController
    private func setupViewBasedOnCellId(cellID:String){
        if cellID == cellIdName.cell1.rawValue {
            titleLabel.text = "انتخاب استان"
            autoLayoutForUITableView()
            provinceReader = ProvinceReader()
            stringDictionaryCollection[CollectionNames.provinceList] = provinceReader.parseProvinceJSON()
        }else if cellID == cellIdName.cell2.rawValue {
            titleLabel.text = "انتخاب دانشکده"
            autoLayoutForUITableView()
            collegListReader = CollegeListReader()
            if let prvnc = DataEntryViewController.province {
                stringDictionaryCollection[CollectionNames.collegeList] = collegListReader.parseCollegeListJSON(provinceName: prvnc)
            }
        }else if cellID == cellIdName.cell3.rawValue {
            titleLabel.text = "انتخاب رشته تحصیلی"
            autoLayoutForUITableView()
            courseListReader = CourseListReader()
            stringDictionaryCollection[CollectionNames.courseList] = courseListReader.readCourseListFromFile()
        }else if cellID == cellIdName.cell4.rawValue {
            titleLabel.text = "انتخاب مقطع تحصیلی"
            autoLayoutForUITableView()
            gradListReader = GradeListReader()
            stringDictionaryCollection[CollectionNames.gradeList] = gradListReader.readGradList()
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
            stringDictionaryCollection[CollectionNames.receiverList] = receiverListReader.readReceiverList()
        }else if cellID == cellIdName.cell8.rawValue {
            titleLabel.text = "متن پیام"
            autoLayoutForTextView()
        }
        
    }//func
    
    //setting up uitableView
    private func setupTableView(){
        tableViewItems.dataSource = self
        tableViewItems.delegate = self
        tableViewItems.register(DataEntryVCItemsCell.self, forCellReuseIdentifier: "itemsCell")
        tableViewItems.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableViewItems.tableFooterView = UIView()
    }//func
    
    //select an image from gallery
    @objc private func handleAttachmentButton(_ button:UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    //handle confirm button action based on which view is seted up
    @objc private func handelConfirmAction(_ btn:UIButton){
        if selectedCellID == cellIdName.cell5.rawValue {
            let name = nameTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let lastName = lastNameTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if name != nil && name != "" && lastName != nil && lastName != ""{
                let fullname = name! + " " + lastName!
                delegate?.getFullName(fullName: fullname)
                self.dismiss(animated: true, completion: nil)
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا مقادیر لازم را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }else if selectedCellID == cellIdName.cell6.rawValue {
            let studentId = studentIdTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            if studentId != nil && studentId != "" && !(studentId?.isEmpty)!{
                if isStudentID(st_ID: studentId!){
                    delegate?.getStudentId(id: studentId!)
                    self.dismiss(animated: true, completion: nil)
                }else{
                    TVUAlertView.showAlert(title: "خطا", message: "شماره دانشجویی معتبر نیست \n ", vc: self, btnText: "باشه")
                }
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا شماره دانشجویی خود را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }else if selectedCellID == cellIdName.cell8.rawValue{
            let comment = ticketTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if comment != "" && !(comment.isEmpty) && comment != "متن پیام خود را اینجا وارد کنید"{
                delegate?.getCommentAndAttachment(comment: comment, imageData: imageData)
                self.dismiss(animated: true, completion: nil)
            }else{
                TVUAlertView.showAlert(title: "خطا", message: "لطفا مقادیر لازم را وارد کنید", vc: self, btnText: "باشه")
                return
            }
        }
       
        
    }//func
    
    //check if student id is correct or not
    private func isStudentID(st_ID:String) -> Bool{
        guard st_ID.count == 14 else {return false}
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: st_ID))
    }
    
    //dismiss view controller
    @objc private func handleCloseButton(_ button:UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func restoreAllTikcets(){
        
        let activityIndicator = CustomActivityIndicator(title: "بارگذاری...")
        view.addSubview(activityIndicator)
         activityIndicator.anchor(top: nil, leading: nil, trailing: nil, bottom: nil, height: 100, width: 140, XAxis: view.centerXAnchor, YAxis: view.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        activityIndicator.startAnimating()
        
        let sortQuery = DataQueryBuilder()
        sortQuery!.setSortBy(["created DESC"])
        
        dataStore?.find(sortQuery, response: { (tickets:[Any]?) in
            let ticket = tickets as! [Dictionary<String,AnyObject>]
            self.studentTickes = StudentTicket.basicParsingStudentTicket(ticket)
            DispatchQueue.main.async {
                self.tableViewItems.reloadData()
                activityIndicator.stopAnimating()
            }
        }, error: { (fault) in
            print("Fault:\(fault.debugDescription)")
        })
    }
    
}//class
