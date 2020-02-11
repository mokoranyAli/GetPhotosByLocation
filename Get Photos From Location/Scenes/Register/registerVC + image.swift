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
    
      func handleSelectProfileImageView() {
            let picker = UIImagePickerController()
            
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }
        
       
        
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            // Local variable inserted by Swift 4.2 migrator.
            let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
            
            
            var selectedImageFromPicker: UIImage?
            
            if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
                selectedImageFromPicker = editedImage
            } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                
                selectedImageFromPicker = originalImage
            }
            
            if let selectedImage = selectedImageFromPicker {
                profileImageView.image = selectedImage
            }
            
            dismiss(animated: true, completion: nil)
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("canceled picker")
            dismiss(animated: true, completion: nil)
        }
        
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [String: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {result in (result.key, result.value)})
    }

}
