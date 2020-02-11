//
//  searchProtocols.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import MapKit

//MARK: Wireframe -
protocol searchWireframeProtocol: class {

    func showPhotosScreen(lat:Double , long:Double)
}
//MARK: Presenter -
protocol searchPresenterProtocol: class {
    
    
   // func performSearch(text:String , completionHandler:@escaping([MKMapItem])->())
    func performSearch(text:String)
    func showPhotosScreen(lat:Double , long:Double)

}

//MARK: Interactor -
protocol searchInteractorProtocol: class {

  var presenter: searchPresenterProtocol?  { get set }
}

//MARK: View -
protocol searchViewProtocol: class {

  var presenter: searchPresenterProtocol?  { get set }
    func updateMapItems(items:[Any])
}
