//
//  MapViewController.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/30/22.
//

import Foundation
import MapKit
import UIKit


class MapViewController: UIViewController,MKMapViewDelegate{
    
    let mapView = MKMapView()
    
    let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
    
    // for multiple pins when grabbed from the api
    var pins = [MKPointAnnotation]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        mapView.delegate = self
        
        
    }
    
    
    
    
    private func setup(){
        
        // MARK: MapView
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.overrideUserInterfaceStyle = .dark
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
        
        addPins()
        view.addSubview(mapView)
    }
    
    
    
    private func layout(){
        
        // MARK: MapView Layout
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
    
    private func addPins(){
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Al Furqaan"
        mapView.addAnnotation(pin)
    }
    
    
    
}




extension MapViewController{
    
    // when the pin is tapped we will pop out the bottom modal card with animations
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // Perform the action when the pin is tapped
        let modalViewController = ModalViewController()

        // Present the modal view controller
        present(modalViewController, animated: true, completion: nil)
    }
}
