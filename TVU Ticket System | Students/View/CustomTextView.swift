//
//  CustomUITextField.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/2/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextView:UITextView {
    
    let lightGrayX = UIColor.gray.withAlphaComponent(0.4)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.delegate = self
        self.text = "متن پیام خود را اینجا وارد کنید"
        self.textColor = lightGrayX
        self.textAlignment = .right
        self.font = UIFont(name: "BTraffic", size: 20)
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = lightGrayX.cgColor
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
}//class

extension CustomTextView : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == lightGrayX {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty  {
            textView.text = "متن پیام خود را اینجا وارد کنید"
            textView.textColor = lightGrayX
        }
    }
    
}
