//
//  User.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum UserCodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
}

struct UserRepresentation: Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var username: String
    var password: String
    var owner: Bool
    var avatar: URL?
    var token: String?
}
