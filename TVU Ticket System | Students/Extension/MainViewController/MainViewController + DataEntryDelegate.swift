//
//  MainViewController + DataEntryDelegate.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/7/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit



extension MainViewController : DataEntryDelegate {
    
    
    func provinceSelected(provinceName: String?) {
        if let province = provinceName {
            students.st_province = province
        }
    }
    
    func collegeSelected(collegeName: String?) {
        if let college = collegeName {
            students.st_college = college
        }
    }
    
    func courseSelected(courseName: String?) {
        if let course = courseName {
            students.st_course = course
        }
    }
    
    func gradeSelected(gradeName: String?) {
        if let grade = gradeName {
            students.st_grade = grade
        }
    }
    
    func getFullName(fullName: String?) {
        if let fullname = fullName {
            students.st_fullname = fullname
        }
    }
    
    func getStudentId(id: String?) {
        if let id = id {
            students.st_ID = id
        }
    }
    
    func receiverSelected(receiverName: String?) {
        if let receiver = receiverName {
            students.st_receiverName = receiver
        }
    }
    
    func getCommentAndAttachment(comment: String?,imageData:Data?) {
        if let comment = comment , let image = imageData{
            students.st_comment = comment
            self.imageData = image
        }
    }
    
}
