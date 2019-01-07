//
//  CourseListReader.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/5/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

//Read CourseList.plist file and return an array of string

class CourseListReader {
    
    func readCourseListFromFile() -> [String] {
        var courses:[String] = []
        
        if let path = Bundle.main.url(forResource: "CourseList", withExtension: "plist"){
            if let data = try? Data(contentsOf: path) {
                
                if let result = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! [String]{
                    
                    courses = result
                    
                }//result
                
            }//data
            
        }//path
        
        return courses
    }//func
    
}//class

