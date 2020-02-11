//
//  View + delegates.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation
import UIKit
import AnAlertView


extension loginViewController : loginViewProtocol {
    
    
    func showErrorAlert(error: String) {
        AlertView.showAlert(message: error, button: "ok", delegate: self, container: self, image: UIImage(named: "warning"))
      }
      
    
    
      
      func showIndicator() {
          showActivityIndicator()
      }
      
      func hideIndicator() {
          hideActivityIndicator()
      }
}
