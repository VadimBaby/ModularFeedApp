//
//  CoreDataStorage.swift
//  Persistance
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//

import CoreData
// swiftlint:disable:next foundation_using
import Foundation
import PersistanceInterfaces

// swiftlint:disable generic_constraint_naming
public class Persistance: PersistanceProtocol {
    private let store: PersistenceStore
    
    public init(model: String, bundle: Bundle) {
        self.store = .init(model: model, for: bundle)
    }
    
    public func deleteAll<Entity: NSManagedObject>(type: Entity.Type) async throws {
        try await viewContext.perform { [weak self] in
            guard let self else { return }
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "\(Entity.self)")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try self.viewContext.execute(deleteRequest)
            try self.saveContext()
        }
    }
    
    public func create<Entity: NSManagedObject>(
        type: Entity.Type,
        configure: @escaping (Entity) -> Void
    ) async throws {
        try await viewContext.perform { [weak self] in
            guard let self else { return }
            let entity = Entity(context: viewContext)
            configure(entity)
            try self.saveContext()
        }
    }
    
    public func createMany(
        configureMany: @escaping (NSManagedObjectContext) -> Void
    ) async throws {
        try await viewContext.perform { [weak self] in
            guard let self else { return }
            
            configureMany(viewContext)
            try self.saveContext()
        }
    }
    
    public func update<Entity: NSManagedObject>(
        entity: Entity,
        configure: @escaping (Entity) -> Void
    ) async throws {
        try await viewContext.perform { [weak self] in
            guard let self else { return }
            
            configure(entity)
            try self.saveContext()
        }
    }
}

// MARK: - Fetchers

public extension Persistance {
    func fetch<Entity: NSManagedObject>(type: Entity.Type) async throws -> [Entity] {
        try await viewContext.perform { [weak self] in
            guard let self else { return [] }
            
            let request = self.createFetchRequest(for: type)
            return try self.viewContext.fetch(request)
        }
    }
    
    func fetch<Entity: NSManagedObject>(
        type: Entity.Type,
        configureRequest: @escaping (NSFetchRequest<Entity>) -> Void
    ) async throws -> [Entity] {
        try await viewContext.perform { [weak self] in
            guard let self else { return [] }
            
            let request = self.createFetchRequest(for: type)
            configureRequest(request)
            return try self.viewContext.fetch(request)
        }
    }
    
    func fetch<Entity: NSManagedObject, T: CVarArg>(by id: T, type: Entity.Type) async throws -> Entity? {
        try await fetch(type: type) { request in
            request.predicate = NSPredicate(format: "id == %d", id)
            request.fetchLimit = 1
        }.first
    }
}

// MARK: - Private Methods

private extension Persistance {
    func createFetchRequest<Entity: NSManagedObject>(for type: Entity.Type) -> NSFetchRequest<Entity> {
        return NSFetchRequest(entityName: "\(Entity.self)")
    }
    
    var viewContext: NSManagedObjectContext {
        store.viewContext
    }
    
    func saveContext() throws {
        try store.viewContext.save()
    }
}
// swiftlint:enable generic_constraint_naming
