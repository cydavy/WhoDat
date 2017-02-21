//
//  Team+CoreDataClass.swift
//  WhoDat
//
//  Created by Davy Li on 2/20/17.
//  Copyright © 2017 Davy Li. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Team)
public class Team: NSManagedObject {
    
    func populate(fromJSON json: JSON?) {
        guard let json = json else {
            return
        }
        
        id = json["id"].string
        city = json["city"].string
        name = json["name"].string
        abbreviation = json["abbreviation"].string
        league = json["league"].string
        colour = json["colour"].string

    }

}
