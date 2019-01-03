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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.text = "متن پیام خود را اینجا وارد کنید"
        self.textColor = lightGrayX
        self.textAlignment = .right
        self.font = UIFont(name: "BTraffic", size: 17)
    }
    
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            updateTextFieldStyle()
        }
    }
    
    func updateTextFieldStyle() {
        self.layer.cornerRadius = cornerRadius
    }
    
    
    override func prepareForInterfaceBuilder() {
        updateTextFieldStyle()
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
