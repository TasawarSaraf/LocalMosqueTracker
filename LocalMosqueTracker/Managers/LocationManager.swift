//
//  LocationManager.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/29/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
  let locationManager = CLLocationManager()
  var currentLocation: CLLocationCoordinate2D?
  
  override init() {
    super.init()
    
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
  }
  
    
    // we need to run this when we init that view controller so we know the users current location
  func startUpdatingLocation() {
    locationManager.startUpdatingLocation()
  }
    
    // we will use this when the user moves to the next screen
  func stopUpdatingLocation() {
    locationManager.stopUpdatingLocation()
  }
  
    // the delegate method that will return the currentlocations coordinates (latitude, longitude)
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    currentLocation = locations.first?.coordinate
  }
  
    
    // this is the getter method to return the currentLocation
  func getCurrentLocation() -> CLLocationCoordinate2D? {
    return currentLocation
  }
}

