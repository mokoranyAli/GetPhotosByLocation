//
//  SearchViewController.swift
//  Get Photos From Location
//
//  Created by Mohamed Korany Ali on 2/11/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import UIKit
import MapKit

class searchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource,  searchViewProtocol{
    
    
    var presenter: searchPresenterProtocol?
    
    
    var photoVCDelegate:LatLongDelegate?
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var placesTableView: UITableView!
    var places = [MKMapItem]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
      
       
    }
    
    func updateMapItems(items: [Any]) {
        self.places = items as! [MKMapItem]
        self.placesTableView.reloadData()
    }
    
    
    func performSearch(text:String){
      
            
        presenter?.performSearch(text: text)
            
            
            
            
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let placemark = places[indexPath.row].placemark
        cell.textLabel?.text = placemark.title
        cell.detailTextLabel?.text = placemark.subtitle
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        presenter?.showPhotosScreen(lat:places[indexPath.row].placemark.coordinate.latitude , long:places[indexPath.row].placemark.coordinate.longitude)
        
//        let vc = photosRouter.createModule()
//        self.photoVCDelegate = vc as? LatLongDelegate
//        self.photoVCDelegate?.updateLatLong(lat: places[indexPath.row].placemark.coordinate.latitude, long: places[indexPath.row].placemark.coordinate.longitude)
//        self.present(vc, animated: true, completion: nil)
        
        
    }
}




extension searchViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let text = searchBar.text else { return }
        performSearch(text: text)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else { return }
        performSearch(text: text)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        dismiss(animated: true, completion: nil)
        print("done")
    }
}
