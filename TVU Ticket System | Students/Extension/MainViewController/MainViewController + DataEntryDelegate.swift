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
        students.st_province = provinceName
    }
    
    func collegeSelected(collegeName: String?) {
        students.st_college = collegeName
    }
    
    func courseSelected(courseName: String?) {
        students.st_course = courseName
    }
    
    func gradeSelected(gradeName: String?) {
        students.st_grade = gradeName
    }
    
    func getFullName(fullName: String?) {
        students.st_fullname = fullName
    }
    
    func getStudentId(id: String?) {
        students.st_ID = id
    }
    
    func receiverSelected(receiverName: String?) {
        students.st_receiverName = receiverName
    }
    
    func getCommentAndAttachment(comment: String?) {
        students.st_comment = comment
    }
    
}
