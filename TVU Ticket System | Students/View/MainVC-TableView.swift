//
//  CustomTableView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class MainVCTableView: UITableView {
    
    //MARK: - Properties

    let cellReuseID = "ItemsCell"
    var items:[String] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Overridden Method
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    private func setupTableView(){
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.register(MainVCItemsCell.self ,forCellReuseIdentifier: cellReuseID)
        items = MainVCItemsModel.loadItems()
    }
    
}//class

extension MainVCTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID) as! MainVCItemsCell
        let item = items[indexPath.row]
        cell.cellID = "cell\(indexPath.row + 1)"
        cell.configureCell(itemsString: item)
        return cell
    }
    
    
}//extesnion


extension MainVCTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MainVCItemsCell
        print("Cell Id : \(cell.cellID)")
    }
}//extension
