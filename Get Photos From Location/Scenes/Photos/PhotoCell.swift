//
//  PhotoCell.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import UIKit


class PhotoCell: UICollectionViewCell , PhotoCellViewProtocol {
   
     fileprivate let imageProvider = ImageProvider()
    func configure(photos: Photo) {
    guard let mediaUrl = photos.getImagePath() else {
               return
           }
           //print(model.owner)
        
        let image = imageProvider.cache.object(forKey: URL(string: mediaUrl)! as NSURL)
                      self.imageResult.backgroundColor = UIColor(white: 0.95, alpha: 1)
                       self.imageResult.image = image
        if image == nil {
            imageProvider.requestImage(from :URL(string: mediaUrl)!, completion: { image -> Void in
               
                    self.imageResult.image = image
                
            })
        }
           
        print(mediaUrl)
          // self.imageResult.sd_setImage(with: URL(string: mediaUrl) , completed: nil)
    }
    
   
    
      @IBOutlet weak var imageResult: UIImageView!
}
