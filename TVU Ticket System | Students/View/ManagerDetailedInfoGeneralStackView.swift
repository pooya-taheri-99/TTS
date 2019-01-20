//
//  ManagerDetailedInfoGeneralStackView.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/20/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit



class ManagerDetailedInfoGeneralStackView : UIStackView {
    
    
    var st_fullName_Label = GeneralLabel(fontSize:18.0 , textAlignment: .center)
    var st_collegeName_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    var st_ID_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    var st_province_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    var st_grade_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    var st_course_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    var st_message_Label = GeneralLabel(fontSize: 18.0, textAlignment: .center)
    
    
    private var stackView1:UIStackView = {
        let stk = UIStackView()
        stk.alignment = .fill
        stk.axis = .horizontal
        stk.distribution = .fillEqually
        return stk
    }()
    
    
    private var stackView2:UIStackView = {
        let stk = UIStackView()
        stk.alignment = .fill
        stk.axis = .horizontal
        stk.distribution = .fillEqually
        return stk
    }()
    
    
    private var stackView3:UIStackView = {
        let stk = UIStackView()
        stk.alignment = .fill
        stk.axis = .horizontal
        stk.distribution = .fillEqually
        return stk
    }()
    
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPrimaryStackView()
        stackView1.addArrangedSubview(st_ID_Label)
        stackView1.addArrangedSubview(st_fullName_Label)
        stackView2.addArrangedSubview(st_course_Label)
        stackView2.addArrangedSubview(st_grade_Label)
        stackView3.addArrangedSubview(st_province_Label)
        stackView3.addArrangedSubview(st_collegeName_Label)
        for stackView in self.arrangedSubviews as! [UIStackView] {
            
            for label in stackView.arrangedSubviews as! [GeneralLabel]{
                label.hasBorder = true
            }//for2
            
        }//for1
    }
    
    
    private func setupPrimaryStackView(){
        self.spacing = 15
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .vertical
        self.addArrangedSubview(stackView1)
        self.addArrangedSubview(stackView2)
        self.addArrangedSubview(stackView3)
    }
    
}//class
