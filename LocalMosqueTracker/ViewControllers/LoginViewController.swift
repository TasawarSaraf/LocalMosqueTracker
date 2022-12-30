//
//  ViewController.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/29/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let mosqueImageView = UIImageView()
    let titleLabel = UILabel()
    let getStartedButton = UIButton()
    
    var locationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.startUpdatingLocation()
        setup()
        layout()
    }
    
    
    
    private func setup(){
        
        //MARK: main view
        view.backgroundColor = UIColor(named: "appColor")
        
        // MARK: ImageView
        mosqueImageView.translatesAutoresizingMaskIntoConstraints = false
        // most of the times you will be using this
        mosqueImageView.contentMode = .scaleAspectFit
        mosqueImageView.image = UIImage(named: "MosqueImage")
        
        //MARK: TitleLabel
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Find Your Local Mosque"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        
        // MARK: GetStartedButton
        
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.backgroundColor = .brown
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.layer.cornerRadius = 8.0
        getStartedButton.layer.borderWidth = 2.0
        getStartedButton.layer.borderColor = UIColor.white.cgColor
        getStartedButton.addTarget(self, action: #selector(getCurrentLocationTapped), for: .primaryActionTriggered)
        
        
        view.addSubview(mosqueImageView)
        view.addSubview(titleLabel)
        view.addSubview(getStartedButton)
        
    }
    
    private func layout(){
        
        
        // MARK: Image View Constraints
        NSLayoutConstraint.activate([
            mosqueImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            mosqueImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            mosqueImageView.widthAnchor.constraint(equalToConstant: 200),
            mosqueImageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        
        // MARK: Title Label Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: mosqueImageView.bottomAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
        ])
        
        // MARK: GetStarted Button Constraints
        
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: getStartedButton.bottomAnchor, multiplier: 10),
            getStartedButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 5),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: getStartedButton.trailingAnchor, multiplier: 5)
        ])
    }


}




extension LoginViewController{
    
    
    // MARK: Get current location when the button is tapped
    @objc func getCurrentLocationTapped(sender: UIButton){
        if let currentLocation = locationManager.getCurrentLocation() {
            print("Latitude: \(currentLocation.latitude)")
            print("Longitude: \(currentLocation.longitude)")
        } else {
            print("Current location not available")
        }
        
        locationManager.stopUpdatingLocation() // should I remove this ??
    }
}

