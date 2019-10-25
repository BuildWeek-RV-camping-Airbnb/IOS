//
//  Listing.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum ListingCodingKeys: String, CodingKey {
    case propertyID = "property_id"
    case amenityID = "amenity_id"
}

struct ListingRepresentation: Codable {
    var propertyID: String
    var amenityID: String
    var id: Int?
}
