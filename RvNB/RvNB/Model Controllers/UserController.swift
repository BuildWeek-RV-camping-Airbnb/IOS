//
//  UserController.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/21/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//
import Foundation

// MARK: - Enums
enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class UserController {
    let baseURL = URL(string: "https://rvnb-mock-database.firebaseio.com/")!
    
    let usersArray: [UserRepresentation] = []
    // MARK: - Networking Methods
    func createUser(firstName: String?, lastName: String?, email: String?, username: String, password: String, owner: Bool, avatar: URL) -> UserRepresentation {
        let id: Int = usersArray.count + 1
        
        let newUserRepresentation = UserRepresentation(firstName: firstName, lastName: lastName, email: email, username: username, password: password, owner: owner, avatar: avatar)
        
        return newUserRepresentation
    }
    
    func put(userRep: UserRepresentation, completion: @escaping (NetworkError?) -> Void) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.put.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error PUTting data: \(error)")
                completion(.otherError)
                return
            }
            
            guard let data = data else {
                NSLog("Error unwrapping data on line \(#line) in \(#file)")
                completion(.badData)
                return
            }
            
            do {
                request.httpBody = try JSONEncoder().encode(data)
            } catch {
                NSLog("Error encoding UserRepresentation data on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
            
            completion(.none)
        }.resume()
    }
}
