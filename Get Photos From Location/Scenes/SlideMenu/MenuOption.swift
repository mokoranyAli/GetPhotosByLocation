//
//  MenuOption.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/13/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import UIKit
enum MenuOption: Int, CustomStringConvertible {
    
    case Profile
    case Favorit
    case Navigation
    case Logout
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Favorit: return "Favorit"
        case .Navigation: return "Navigation"
        case .Logout: return "Logout"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Favorit: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Navigation: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
        case .Logout: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        }
    }
}
