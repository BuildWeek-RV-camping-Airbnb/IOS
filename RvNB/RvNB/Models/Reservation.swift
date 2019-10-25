//
//  Reservation.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum ReservationCodingKeys: String, CodingKey {
    case startDate = "start_date"
    case endDate = "end_date"
    case propertyID = "property_id"
    case userID = "user_id"
}

struct ReservationRepresentation: Codable {
    var startDate: Date
    var endDate: Date
    var propertyID: Int
    var userID: Int
}
