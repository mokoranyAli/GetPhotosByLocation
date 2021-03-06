//
//  homeViewController.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import MapKit
class homeViewController: UIViewController, homeViewProtocol {
    
    
    var delegate: HomeControllerDelegate?
    
    @IBOutlet weak var mapView: MKMapView!
    var presenter: homePresenterProtocol?
   
    @IBAction func searchButtonItemClicked(_ sender: Any) {
        
         presenter?.showSearchController()
        print("search")
    }
    
  
    
    
    func configureNavigationBar() {
              navigationController?.navigationBar.barTintColor = .darkGray
              navigationController?.navigationBar.barStyle = .black
              
              navigationItem.title = "Location's photos"
              navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
          }
       
       @objc func handleMenuToggle() {
           delegate?.handleMenuToggle(forMenuOption: nil)
       }
    
    
    
    @objc func didMenuSelected() {
           print("handle menu")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController?.isToolbarHidden = false
      configureNavigationBar()
        mapView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(didLongpressed(sender:))))
        
    }
    
    @objc func didLongpressed(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
           annotation.coordinate = locationCoordinate
           mapView.addAnnotation(annotation)
        
        presenter?.showPhotosViewController(lat: locationCoordinate.latitude, long:locationCoordinate.longitude )
    }
    
    
}
