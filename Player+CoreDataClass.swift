//
//  Player+CoreDataClass.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Player)
public class Player: NSManagedObject {
    
    func populate(fromJson json: JSON?) {
        guard let json = json else {
            return
        }
        
        id = json["id"].string
        lastName = json["lastName"].string
        firstName = json["firstName"].string
        age = json["age"].int16 ?? 0
        birthCity = json["birthCity"].string
        birthCountry = json["birthCountry"].string
        birthDate = json["birthDate"].string
        gamesPlayed = json["gamesPlayed"].int16 ?? 0
        height = json["height"].string
        isRookie = json["isRookie"].boolValue
        jerseyNumber = json["jerseyNumer"].int16 ?? 0
    }
}
