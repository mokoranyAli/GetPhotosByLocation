//
//  loginRouter.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import UIKit

class loginRouter: loginWireframeProtocol {
    
    private weak var navigationController: UINavigationController?
    
  
    

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        
         let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(loginViewController.self)") as! loginViewController
        let interactor = loginInteractor()
        let router = loginRouter()
        let presenter = loginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.isNavigationBarHidden = true
        
        
        router.navigationController = navigationController

        return navigationController
    }
    
    func showSignUpScreen() {
        
        let vc = registerRouter.createModule()
        navigationController?.pushViewController(vc, animated: true)
      }
      
      func showHomeScreen() {
        
        let vc = homeRouter.createModule()
        navigationController?.pushViewController(vc, animated: true)
      }
    
    
    
}
