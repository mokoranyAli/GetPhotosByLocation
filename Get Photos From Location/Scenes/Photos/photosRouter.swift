//
//  photosRouter.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
import UIKit

class photosRouter: photosWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(photosViewController.self)") as! photosViewController
        let interactor = photosInteractor()
        let networkManger = FlickerAPI()
        let router = photosRouter()
        let presenter = photosPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        interactor.networkManger = networkManger
        router.viewController = view

        return view
    }
}
