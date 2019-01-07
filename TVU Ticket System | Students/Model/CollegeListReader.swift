//
//  CollegeListReader.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/5/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class CollegeListReader {

    
    func parseCollegeListJSON(provinceName:String) -> [String] {
        
        var collegeListsForProvince:[String] = []
        
        if let path = Bundle.main.url(forResource: "TVU_CollegeList", withExtension: "json") {
            
            if let data = try? Data(contentsOf: path) {
                
                if let result = try? JSONSerialization.jsonObject(with: data, options: []) as! [Dictionary<String,Any>] {
                    collegeListsForProvince = parseJSONData(arrDictionary: result, provinceName: provinceName)
                }
                
            }//if let data
            
        }//if let path
        
        return collegeListsForProvince
    }
    
    
    
    private func parseJSONData(arrDictionary:[Dictionary<String,Any>] , provinceName:String) -> [String] {
        
        var collegLists:[String] = []
        
        for jsonObject in arrDictionary {
            
            if let province = jsonObject["provinceName"] as? String {
                
                if province == provinceName {
                    
                    for collegeList in jsonObject["collegeLists"] as! Array<String> {
                        collegLists.append(collegeList)
                    }
                    
                }//province
            
            }// if let province
            
        }//for
        
        return collegLists
    }
    
    deinit {
        print("CollegeList Deinitialized.")
    }
    
}//class
