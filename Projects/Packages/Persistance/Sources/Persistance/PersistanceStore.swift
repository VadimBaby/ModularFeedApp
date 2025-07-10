//
//  PersistanceStore.swift
//  Persistance
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreData
import Common

final class PersistenceStore {
    public let container: NSPersistentContainer
    
    public lazy var viewContext: NSManagedObjectContext = container.newBackgroundContext() &> {
        $0.automaticallyMergesChangesFromParent = true
    }
    
    public init(model: String, for bundle: Bundle) {
        guard let modelURL = bundle.url(forResource: model, withExtension: "momd") else {
            fatalError("Failed to find model \(model) in bundle")
        }
        
        guard let objectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Failed to load model from \(modelURL)")
        }
        
        self.container = NSPersistentContainer(name: model, managedObjectModel: objectModel)
        self.container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            debugPrint("Successfully loaded persistent store: \(description)")
        }
    }
}
