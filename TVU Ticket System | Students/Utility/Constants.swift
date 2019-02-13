//
//  Constants.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/23/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class Constants {
    static let BTrafficFont:String = "BTraffic"
    static let smallFontSize:CGFloat = 15.0
    static let normalFontSize:CGFloat =  20.0
    static let bigFontSize:CGFloat = 25.0
    static private let ROOT_ADDRESS = "https://backendlessappcontent.com/"
    static private let APP_ID = "0189D3C3-383E-C1A2-FFD5-D9B7E21E6500/"
    static private let REST_API_KEY = "B9566F1A-EFF7-319C-FF27-091AD6829000/"
    static private let FILES_PATH = "files/images/"
   
    
    
    static var IMAGES_ROUTE:String = {
        return "\(Constants.ROOT_ADDRESS)\(Constants.APP_ID)\(Constants.REST_API_KEY)\(Constants.FILES_PATH)"
    }()
}
