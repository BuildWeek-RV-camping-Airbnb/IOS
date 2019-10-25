//
//  CoreDataStack.swift
//  RvNB
//
//  Created by Alex Shillingford on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData

// Contain all of the setup of the NSPersistentContainer
class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {
        
    }
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "RvNB")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        context.performAndWait {
            do {
                try context.save()
            } catch {
                NSLog("Error saving context: \(error)")
                context.reset()
            }
        }
    }
}

