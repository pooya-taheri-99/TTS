//
//  File.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/17/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit

//UIImagePickerControllerDelegate For DataEntryViewController

extension DataEntryViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let picker = info[.originalImage] as? UIImage
        if let image = picker{
            let imageData:Data = image.jpegData(compressionQuality: 0.6)!
            self.imageData = imageData
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

