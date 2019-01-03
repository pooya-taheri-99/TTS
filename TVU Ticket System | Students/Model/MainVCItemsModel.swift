//
//  MainVCItemsModel.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class MainVCItemsModel {
    
    static func loadItems() -> [String] {
        var itemsTitle:[String] = []
        if let fileURL = Bundle.main.url(forResource: "MainVC_Items", withExtension: "plist"){
            if let data = try? Data(contentsOf: fileURL) {
                if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) {
                    itemsTitle = result as! [String]
                }//if let result
                
            }//if let data
           
        }//if let fileURL
        return itemsTitle
    }//loadItems
    
}//class
