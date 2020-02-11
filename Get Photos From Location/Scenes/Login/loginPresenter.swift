//
//  loginPresenter.swift
//  Get Photos By Location
//
//  Created Mohamed Korany Ali on 2/9/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class loginPresenter: loginPresenterProtocol, loginInteractorOutputProtocol {
      
        weak private var view: loginViewProtocol?
        var interactor: loginInteractorInputProtocol?
        private let router: loginWireframeProtocol
        
        init(interface: loginViewProtocol, interactor: loginInteractorInputProtocol?, router: loginWireframeProtocol) {
            self.view = interface
            self.interactor = interactor
            self.router = router
        }
        
       
        
        func handeLogin(username: String, password: String) {
            view?.showIndicator()
            interactor?.handleLogin(username: username, password: password)
        }
    
    
    func showRegisterPage() {
               router.showSignUpScreen()
           }
           
           func loginDoneSuccessfully() {
               view?.hideIndicator()
               router.showHomeScreen()
           }
           
           func loginFaild(error:Error) {
               view?.hideIndicator()
               view?.showErrorAlert(error: error.localizedDescription)
           }
        
    }