//
//  MosqueTracker.swift
//  LocalMosqueTracker
//
//  Created by Tasawar Saraf on 12/30/22.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mosque = try? newJSONDecoder().decode(Mosque.self, from: jsonData)

import Foundation

// MARK: - Mosque
struct Mosque {
    let total: Int?
    let businesses: [Business]?
    let region: Region?
    
    private enum CodingKeys: String, CodingKey {
       case total
       case businesses
       case region
    }
}




// MARK: - Business
struct Business {
    let id, name: String?
    let imageURL: String?
    let rating: Double?
    let reviewCount: Int?
    let price: String?
    let location: Location?
    
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
        case rating
        case reviewCount = "review_count"
        case price
        case location
    }
}





// MARK: - Location
struct Location {
    let address1, address2, address3, city: String?
    let zipCode, country, state: String?
    let displayAddress: [String]?
    
    private enum CodingKeys: String, CodingKey {
       case address1
       case address2
       case address3
       case city
       case zipCode = "zip_code"
       case country
       case state
       case displayAddress = "display_address"
     }
}

// MARK: - Region
struct Region {
    let center: Center?
    
    
    private enum CodingKeys: String, CodingKey {
       case center
     }
}

// MARK: - Center
struct Center {
    let longitude, latitude: Double?
    
    
    private enum CodingKeys: String, CodingKey {
       case longitude
       case latitude
     }
}
