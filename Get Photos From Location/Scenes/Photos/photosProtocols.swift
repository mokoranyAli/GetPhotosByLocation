//
//  photosProtocols.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol photosWireframeProtocol: class {

}
//MARK: Presenter -
protocol photosPresenterProtocol: class {

    var interactor: photosInteractorInputProtocol? { get set }
    func getPhotos(searchType:SearchingType)
    func configureCell(cell: PhotoCellViewProtocol , indexPath: IndexPath)
    var numberOfRows: Int { get }
    
}

//MARK: Interactor -
protocol photosInteractorOutputProtocol: class {
    func getDataSucssesfully(photos:[Photo])
    func faildToGetData(error:Error)

    /* Interactor -> Presenter */
}

protocol photosInteractorInputProtocol: class {

    var presenter: photosInteractorOutputProtocol?  { get set }
    func getPhotos(searchType:SearchingType)
    

    /* Presenter -> Interactor */
}

//MARK: View -
protocol photosViewProtocol: class {

    var presenter: photosPresenterProtocol?  { get set }
    func showLoadingIndicator()
       func hideLoadingIndicator()
       func reloadData()

    /* Presenter -> ViewController */
}


protocol PhotoCellViewProtocol {
    func configure(photos: Photo)
    
}
