//
//  Game+CoreDataProperties.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged public var id: String?
    @NSManaged public var date: String?
    @NSManaged public var location: String?
    @NSManaged public var time: String?
    @NSManaged public var league: String?
    @NSManaged public var playingTeams: NSSet?

}

// MARK: Generated accessors for playingTeams
extension Game {

    @objc(addPlayingTeamsObject:)
    @NSManaged public func addToPlayingTeams(_ value: Team)

    @objc(removePlayingTeamsObject:)
    @NSManaged public func removeFromPlayingTeams(_ value: Team)

    @objc(addPlayingTeams:)
    @NSManaged public func addToPlayingTeams(_ values: NSSet)

    @objc(removePlayingTeams:)
    @NSManaged public func removeFromPlayingTeams(_ values: NSSet)

}
