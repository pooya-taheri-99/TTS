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
    
    //MARK: - UI Element
    
    var logoImageView:CustomImageView = {
        let imageView = CustomImageView(frame: .zero)
        imageView.image = UIImage(named: "tvu-logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var tableViewItems:MainVCTableView = {
        let tableView = MainVCTableView()
        return tableView
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
        setupTableView()
        autoLayoutForMainViewController()
    }

    private func setupTableView() {
        tableViewItems.delegate = self
        tableViewItems.dataSource = self
        items = MainVCItemsModel.loadItems()
    }
    
    func dataEntryVCFunctions(cellID:String) {
        if cellID == cellIdName.cell1.rawValue {
            showDataEntryVC(cellID: cellID)
        }else if cellID ==  cellIdName.cell2.rawValue {
            showDataEntryVC(cellID: cellID)
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
    }
    
    private func showDataEntryVC(cellID:String) {
        DispatchQueue.main.async { [unowned self] in
            self.dataEntryVC = DataEntryViewController()
            self.dataEntryVC.selectedCellID = cellID
            self.present(self.dataEntryVC, animated: true, completion: nil)
        }
    }
    
   
    
}//class

