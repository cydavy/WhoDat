//
//  Game.swift
//  WhoDat
//
//  Created by Davy Li on 12/29/16.
//  Copyright © 2016 Davy Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class Game: NSObject {
    
    var id: String?
    var date: String?
    var time: String?
    var homeTeam: Team?
    var awayTeam: Team?
    
    let kHomeTeamKey = "homeTeam"
    let kAwayTeamKey = "awayTeam"

    
    init?(fromJSON: JSON?) {
        guard let json = fromJSON else {
            return nil
        }
        
        id = json["id"].string
        date = json["date"].string
        time = json["time"].string
        homeTeam = Team(fromJSON: json[kHomeTeamKey])
        awayTeam = Team(fromJSON: json[kHomeTeamKey])

    }
}
