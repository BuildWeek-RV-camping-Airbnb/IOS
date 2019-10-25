//
//  User+Convenience.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData

extension User {
    var userRepresentation: UserRepresentation? {
        guard let firstName = firstName,
            let lastName = lastName,
            let email = email,
            let username = username,
            let password = password,
            let avatar = URL(string: avatar ?? "") else { return nil }
        
        let newUserRep = UserRepresentation(id: Int(id), firstName: firstName, lastName: lastName, email: email, username: username, password: password, owner: owner, avatar: avatar)
        
        return newUserRep
    }
    
    convenience init(id: Int32, firstName: String, lastName: String, email: String, username: String, password: String, owner: Bool, avatar: String, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.username = username
        self.password = password
        self.owner = owner
        self.avatar = avatar
    }
}
