//
//  DataController.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//

import Foundation
import CoreData

class DataController: NSObject {
    
    var mainContext: NSManagedObjectContext
    var backgroundContext: NSManagedObjectContext
    
    private var persistanceStoreCoordinator: NSPersistentStoreCoordinator?
    
    override init() {
        self.mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        super.init()
        
        self.persistanceStoreCoordinator = constructPersistantStoreCoordinator()
        
        self.mainContext.persistentStoreCoordinator = self.persistanceStoreCoordinator
        self.backgroundContext.persistentStoreCoordinator = self.persistanceStoreCoordinator
        
        self.mainContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyStoreTrumpMergePolicyType)
        self.backgroundContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyStoreTrumpMergePolicyType)
    }
    
    func saveContext() {
        if self.mainContext.hasChanges {
            do {
                try self.mainContext.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        if self.backgroundContext.hasChanges {
            do {
                try self.backgroundContext.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

private extension DataController {
    func constructPersistantStoreCoordinator() -> NSPersistentStoreCoordinator {
        guard let downloadContentManagedModel = self.createDownloadContentManagedModel() else {
            fatalError("Failed to initialize coredata stack")
        }
        
        guard let coordinator = self.createStoreCoordinator(managedModelObject: downloadContentManagedModel) else {
            fatalError("Failed to initialize coredata stack")
        }
        
        return coordinator
    }
    
    private func createStoreCoordinator(managedModelObject: NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        guard let documentPath = FileManager().documentsDirectory()?.path else {
            return nil
        }
        
        let documentURL = NSURL(fileURLWithPath: documentPath)
        let storeURL = documentURL.appendingPathComponent("Game.sqlite")
        
        let persistantStoreCoodinator = NSPersistentStoreCoordinator(managedObjectModel: managedModelObject)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true,
                           NSInferMappingModelAutomaticallyOption: true]
            
            try persistantStoreCoodinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                             configurationName: nil,
                                                             at: storeURL,
                                                             options: options)
        } catch let error as NSError {
            print("Unable to initialize persistent store coordinator:", error)
            return nil
        }
        
        return persistantStoreCoodinator
    }
    
    private func createDownloadContentManagedModel() -> NSManagedObjectModel? {
        guard let modelURL = Bundle.main.url(forResource: "Game", withExtension: "momd") else {
            return nil
        }
        guard let managedModelObject = NSManagedObjectModel(contentsOf: modelURL) else {
            return nil
        }
        
        return managedModelObject
    }
}
