//
//  GradeListReader.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/10/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class GradeListReader {
    
    func readGradList() -> [String] {
        var grades:[String] = []
        
        if let path = Bundle.main.url(forResource: "GradeList", withExtension: "plist"){
            if let data = try? Data(contentsOf: path) {
                
                if let result = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! [String]{
                    
                    grades = result
                    
                }//result
                
            }//data
            
        }//path
        
        return grades
    }//func
    
    
}//class
