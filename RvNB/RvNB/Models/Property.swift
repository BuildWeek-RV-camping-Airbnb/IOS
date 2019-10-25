//
//  Property.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum PropertyCodingKeys: String, CodingKey {
    case propertyName = "property_name"
    case ownerID = "owner_id"
}

struct PropertyRepresentation: Codable {
    var propertyName: String
    var address: String
    var city: String
    var state: String
    var price: Int
    var rating: Int
    var ownerID: Int
    var id: Int?
}
