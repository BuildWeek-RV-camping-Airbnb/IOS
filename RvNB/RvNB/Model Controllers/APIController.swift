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
    case noEncode
    case getRequestError
    case putRequestError
    case postRequestError
    case deleteRequestError
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class UserController {
    let baseURL = URL(string: "https://bw-rvnb.herokuapp.com")!
    var bearer: Bearer?
    var usersArray: [UserRepresentation] = []
    
    func createUser(firstName: String?, lastName: String?, email: String?, username: String, password: String, owner: Bool, avatar: URL?) -> UserRepresentation {
        
        let newUserRepresentation = UserRepresentation(firstName: firstName, lastName: lastName, email: email, username: username, password: password, owner: owner, avatar: avatar)
        
        postNewUser(userRep: newUserRepresentation)
        return newUserRepresentation
    }
    
    
    // MARK: - Networking-SignIn
    func signUpLogIn(firstName: String?, lastName: String?, email: String?, username: String, password: String, owner: Bool, avatar: URL?, completion: @escaping (NetworkError?) -> Void = { _ in }) {
        let requestURL = baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("users")
            .appendingPathComponent("login")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        var newUserRep = createUser(firstName: firstName, lastName: lastName, email: email, username: username, password: password, owner: owner, avatar: nil)
        
        let userParameters: [String: String] = ["username" : username, "password" : password]
        
        do {
            request.httpBody = try JSONEncoder().encode(userParameters)
        } catch {
            NSLog("Error signing in on line \(#line) in \(#file): \(error)")
            completion(.noAuth)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("\(NSError(domain: "", code: response.statusCode, userInfo: nil))")
                completion(.postRequestError)
                return
            }
            
            if let error = error {
                NSLog("Error on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
            
            guard let data = data else {
                completion(.badData)
                return
            }
            
            do {
                self.bearer = try JSONDecoder().decode(Bearer.self, from: data)
                newUserRep.id = try JSONDecoder().decode(Int.self, from: data)
            } catch {
                NSLog("Error decoding token or user ID on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    // MARK: - Networking-GET User
    func fetchUserIDFromServer(completion: @escaping (NetworkError?) -> Void = { _ in }) {
        let requestURL = baseURL.appendingPathComponent("api").appendingPathComponent("users")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error GETting users from backend on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
            
            guard let data = data else {
                NSLog("Error unwrapping data from GET request on line \(#line) in \(#file)")
                completion(.badData)
                return
            }
            
            do {
                self.usersArray = try JSONDecoder().decode([UserRepresentation].self, from: data)
            } catch {
                NSLog("Error decoding usersArray from data returned from backend on line \(#line) in \(#file): \(error)")
                completion(.noDecode)
            }
            
            completion(.none)
        }.resume()
    }
    
    func getUser(email: String, completion: @escaping (NetworkError?) -> Void = { _ in }) {
        
    }
    
    // MARK: - Networking-POST User
    func postNewUser(userRep: UserRepresentation, completion: @escaping (NetworkError?) -> Void = { _ in }) {
        let requestURL = baseURL.appendingPathComponent("api").appendingPathComponent("users")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        do {
            request.httpBody = try JSONEncoder().encode(userRep)
        } catch {
            NSLog("Error encoding new user for POST to backend on line \(#line) in \(#file): \(error)")
            completion(.noEncode)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    NSLog("Error POSTing new user to backend, Response \(response.statusCode)")
                    completion(.otherError)
                    return
                }
            }
            
            if let error = error {
                NSLog("Error POSTing new user to backend on line \(#line) in \(#file): \(error)")
                completion(.otherError)
                return
            }
        }.resume()
    }
    
    // MARK: - Networking-PUT User
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
