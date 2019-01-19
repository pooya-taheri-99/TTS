//
//  DataEntryDelegate.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/5/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


protocol DataEntryDelegate:class {
    func provinceSelected(provinceName:String?)
    func collegeSelected(collegeName:String?)
    func courseSelected(courseName:String?)
    func gradeSelected(gradeName:String?)
    func getFullName(fullName:String?)
    func getStudentId(id:String?)
    func receiverSelected(receiverName:String?)
    func getCommentAndAttachment(comment:String?,imageData:Data?)
}
