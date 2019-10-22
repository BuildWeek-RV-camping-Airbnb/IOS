//
//  User.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct UserRepresentation {
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var username: String
    var password: String
    var owner: Bool
    var avatar: URL?
}
