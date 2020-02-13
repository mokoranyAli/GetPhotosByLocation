//
//  registerVC + image.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation
import UIKit
extension registerViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @objc func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
        present(picker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in

        })
print("something")
        self.profileImageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [String: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {result in (result.key, result.value)})
}
