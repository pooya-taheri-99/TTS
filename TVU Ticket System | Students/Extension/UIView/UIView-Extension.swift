//
//  UIView + AutoLayout.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


extension UIView {
    
    func anchor(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,trailing:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,height:CGFloat?,width:CGFloat?,XAxis:NSLayoutXAxisAnchor?,YAxis:NSLayoutYAxisAnchor?,padding:UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if  let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let xax = XAxis {
            self.centerXAnchor.constraint(equalTo: xax).isActive = true
        }
       
        if let yax = YAxis {
            self.centerYAnchor.constraint(equalTo: yax).isActive = true
        }
        
    }//func
    
}//extension
