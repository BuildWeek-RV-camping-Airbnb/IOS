//
//  CoreDataStack.swift
//  RvNB
//
//  Created by Lambda_School_Loaner_167 on 10/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData


//second step in co
class CoreDataStack {
    
//    set up the persistent container
    static let shared = CoreDataStack()

    lazy var container: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "RvnB")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError()("Failed to load persistent stores: \(error)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()

    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        var error: Error?
        context.performAndWait {
            do {
                try context.save()
            } catch let saveError {
                error = saveError
            }
        }
        if let error = error { throw error }
    }

}
