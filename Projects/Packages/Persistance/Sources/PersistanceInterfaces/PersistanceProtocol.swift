//
//  CoreDataStorageProtocol.swift
//  Persistance
//
//  Created by Вадим Мартыненко on 08.07.2025.
//  Copyright © 2025 Vadim Martynenko. All rights reserved.
//
// swiftlint:disable generic_constraint_naming
import CoreData
// swiftlint:disable:next foundation_using
import Foundation

public protocol PersistanceProtocol {
    // Create
    func create<Entity: NSManagedObject>(
        type: Entity.Type,
        configure: @escaping (Entity) -> Void
    ) async throws
    
    func createMany(
        configureMany: @escaping (NSManagedObjectContext) -> Void
    ) async throws

    // Read (Fetch)
    func fetch<Entity: NSManagedObject>(
        type: Entity.Type
    ) async throws -> [Entity]
    
    func fetch<Entity: NSManagedObject>(
        type: Entity.Type,
        configureRequest: @escaping (NSFetchRequest<Entity>) -> Void
    ) async throws -> [Entity]
    
    func fetch<Entity: NSManagedObject, T: CVarArg>(
        by id: T,
        type: Entity.Type
    ) async throws -> Entity?

    // Update
    func update<Entity: NSManagedObject>(
        entity: Entity,
        configure: @escaping (Entity) -> Void
    ) async throws
    
    // Delete
    func deleteAll<Entity: NSManagedObject>(
        type: Entity.Type
    ) async throws
}
// swiftlint:enable generic_constraint_naming
