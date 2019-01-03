//
//  MainViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/1/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properteis
    

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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - Helper Method
    
    private func setupView() {
        autoLayoutForMainViewController()
    }

}//class

