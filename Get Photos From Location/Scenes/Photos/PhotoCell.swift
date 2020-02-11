//
//  PhotoCell.swift
//  Get Photos By Location
//
//  Created by Mohamed Korany Ali on 2/10/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell , PhotoCellViewProtocol {
   
    
    func configure(photos: Photo) {
    guard let mediaUrl = photos.getImagePath() else {
               return
           }
           //print(model.owner)
           
        print(mediaUrl)
           self.imageResult.sd_setImage(with: URL(string: mediaUrl) , completed: nil)
    }
    
   
    
      @IBOutlet weak var imageResult: UIImageView!
}
