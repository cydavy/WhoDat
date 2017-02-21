//
//  Player+CoreDataProperties.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player");
    }

    @NSManaged public var id: String?
    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var age: Int16
    @NSManaged public var birthCity: String?
    @NSManaged public var birthCountry: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var gamesPlayed: Int16
    @NSManaged public var height: String?
    @NSManaged public var isRookie: Bool
    @NSManaged public var jerseyNumber: Int16
    @NSManaged public var team: Team?

}
