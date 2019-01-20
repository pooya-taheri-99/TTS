//
//  StudentTicket.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/16/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

class StudentTicket:NSObject {
    
    var st_fullName:String?
    var st_id:String?
    var st_collgeName:String?
    var st_provinceName:String?
    var st_message:String?
    var st_grade:String?
    var st_course:String?
    var st_fileName:String?
    var st_ObejctID:String!
    
    
    override init() {
        super.init()
    }
    
    class func basicParsingStudentTicket(_ arrDictionary:[Dictionary<String,AnyObject>]) -> [StudentTicket]{
        var studentTickets = [StudentTicket]()
        
        for object in arrDictionary {
            let ticket = StudentTicket()
            if let fullname = object["st_fullname"] as? String {
                ticket.st_fullName = fullname
            }
            
            if let studentID = object["st_ID"] as? String{
                ticket.st_id = studentID
            }
            
            if let objId = object["objectId"] as? String {
                ticket.st_ObejctID = objId
            }
            
            studentTickets.append(ticket)
        }//for
        return studentTickets
    }//func
    
    class func advanceParsingStudentTicket(_ arrDictionary:[Dictionary<String,AnyObject>]) -> StudentTicket{
        let ticket = StudentTicket()
        
        for object in arrDictionary {
            
            if let fullname = object["st_fullname"] as? String {
                ticket.st_fullName = fullname
            }
            
            if let studentID = object["st_ID"] as? String{
                ticket.st_id = studentID
            }
            
            if let college = object["st_college"] as? String{
                ticket.st_collgeName = college
            }
            
            if let grade = object["st_grade"] as? String {
                ticket.st_grade = grade
            }
            
            if let course = object["st_course"] as? String {
                ticket.st_course = course
            }
            
            if let fileName = object["st_fileName"] as? String {
                ticket.st_fileName = fileName
            }
            
            if let province = object["st_province"] as? String{
                ticket.st_provinceName = province
            }
            
            if let message = object["st_comment"] as? String {
                ticket.st_message = message
            }
           
        }//for
        
        return ticket
    
    }//func
    
    
}//class
