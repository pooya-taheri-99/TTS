//
//  UserType.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/15/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit



class UserTypeReader {
    
    func readUserType() -> [String] {
        var types:[String] = []
        
        if let path = Bundle.main.url(forResource: "UserType", withExtension: "plist"){
            if let data = try? Data(contentsOf: path) {
                
                if let result = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! [String]{
                    
                    types = result
                    
                }//result
                
            }//data
            
        }//path
        
        return types
    }//func
    
    
}//class
