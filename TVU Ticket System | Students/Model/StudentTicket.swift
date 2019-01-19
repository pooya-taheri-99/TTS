//
//  StudentTicket.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/16/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class StudentTicket:NSObject {
    
    var st_name:String?
    var st_id:String?
    
    override init() {
        super.init()
    }
    
    class func parseStudentTicket(_ arrDictionary:[Dictionary<String,AnyObject>]) -> [StudentTicket]{
        var studentTickets = [StudentTicket]()
        
        for object in arrDictionary {
            let ticket = StudentTicket()
            if let fullname = object["st_fullname"] as? String {
                ticket.st_name = fullname
            }
            
            if let studentID = object["st_ID"] as? String{
                ticket.st_id = studentID
            }
            studentTickets.append(ticket)
        }//for
        return studentTickets
    }//func
    
}
