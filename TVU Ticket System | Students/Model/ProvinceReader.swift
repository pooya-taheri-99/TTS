//
//  ProvinceReader.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/3/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class ProvinceReader {
    
    var provinces_Name:[String] = []
    
    func parseProvinceJSON() -> [String] {
        var provinces:[String] = []
        
        if let path = Bundle.main.url(forResource: "Province", withExtension: "json") {
            
            if let data = try? Data(contentsOf: path) {
            
                if let provinceList = try? JSONSerialization.jsonObject(with: data, options: []) as! [Dictionary<String,Any>] {
                    
                    provinces = parseJSONData(arrDictionary: provinceList)
                    
                }//provinceList
        
            }//data
        
        }//path
        
        return provinces
        
    }//func
    
    
    private func parseJSONData(arrDictionary:[Dictionary<String,Any>]) -> [String]{
        for JsonData in arrDictionary {
            if let provinceName = JsonData["name"] as? String {
                provinces_Name.append(provinceName)
            }
        }
        
        return provinces_Name
        
    }//parseJSONData
    
    deinit {
        print("ProvinceReader Deinitialized.")
    }
    
}//class
