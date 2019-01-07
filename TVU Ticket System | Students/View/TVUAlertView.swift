//
//  CustomAlertView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/5/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class TVUAlertView {
    static func showAlert(title:String,message:String,vc:UIViewController) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "باشه الان انتخاب می کنم", style: .default, handler: nil)
        alertVC.addAction(confirmAction)
        vc.present(alertVC, animated: true, completion: nil)
        
    }//func
    
    
}//class
