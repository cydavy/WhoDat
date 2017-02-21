//
//  Game+CoreDataClass.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Game)
public class Game: NSManagedObject {
    
    func populate(fromJson json: JSON?) {
        guard let json = json else {
            return
        }
        
        id = json["id"].string
        date = json["date"].string
        time = json["time"].string
        location = json["location"].string
        league = json["league"].string
    }
}
