//
//  Bearer.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/22/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct Bearer: Codable {
    var token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    static var shared = Bearer()
}
