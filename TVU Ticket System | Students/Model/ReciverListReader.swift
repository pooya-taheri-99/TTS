//
//  ReciverListReader.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/11/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class ReceiverListReader {
    
    func readReceiverList() -> [String] {
        var recievers:[String] = []
        
        if let path = Bundle.main.url(forResource: "ReceiverList", withExtension: "plist"){
            if let data = try? Data(contentsOf: path) {
                
                if let result = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! [String]{
                    
                    recievers = result
                    
                }//result
                
            }//data
            
        }//path
        
        return recievers
    }//func
    
}//class
